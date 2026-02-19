#!/bin/bash

# Define search patterns for your two audio devices
PATTERN1="HyperX"
PATTERN2="hdmi"

# Get all available sinks
get_sink_by_pattern() {
    pactl list short sinks | grep -i "$1" | head -n1 | awk '{print $2}'
}

# Find devices matching the patterns
DEVICE1=$(get_sink_by_pattern "$PATTERN1")
DEVICE2=$(get_sink_by_pattern "$PATTERN2")

# Check if both devices were found
if [ -z "$DEVICE1" ]; then
    echo "Error: No device found matching '$PATTERN1'"
    exit 1
fi

if [ -z "$DEVICE2" ]; then
    echo "Error: No device found matching '$PATTERN2'"
    exit 1
fi

# Get the current default sink
current=$(pactl get-default-sink)

# Switch to the other device
if echo "$current" | grep -qi "$PATTERN1"; then
    pactl set-default-sink "$DEVICE2"
    echo "Switched to: $DEVICE2"
else
    pactl set-default-sink "$DEVICE1"
    echo "Switched to: $DEVICE1"
fi

# Move all currently playing streams to the new sink
new_sink=$(pactl get-default-sink)
pactl list short sink-inputs | while read -r stream; do
    stream_id=$(echo "$stream" | cut -f1)
    pactl move-sink-input "$stream_id" "$new_sink" 2>/dev/null
done
