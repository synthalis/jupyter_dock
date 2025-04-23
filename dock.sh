#!/bin/bash

# dock.sh - A wrapper script for running AutoDock Vina in a Docker container
# Created: $(date)

# Display help information
show_help() {
    echo "Usage: ./dock.sh [VINA_OPTIONS]"
    echo ""
    echo "This script runs AutoDock Vina in a Docker container, mounting the current"
    echo "directory to /data in the container."
    echo ""
    echo "Example usage:"
    echo "  ./dock.sh --receptor receptor.pdbqt --ligand ligand.pdbqt \\"
    echo "         --center_x 0 --center_y 0 --center_z 0 \\"
    echo "         --size_x 20 --size_y 20 --size_z 20"
    echo ""
    echo "For more information on Vina options, run:"
    echo "  ./dock.sh --help"
    echo ""
}

# Check if help is requested specifically for this script
if [[ "$1" == "--script-help" ]]; then
    show_help
    exit 0
fi

# Run AutoDock Vina in Docker with all provided arguments
echo "Running AutoDock Vina in Docker container..."
echo "Current directory mounted as /data inside container"
echo ""

docker run --rm -v "$(pwd):/data" autodock-vina "$@"

# Check the exit status
exit_status=$?
if [ $exit_status -ne 0 ]; then
    echo ""
    echo "AutoDock Vina exited with status code: $exit_status"
    echo "For help on using this script, run: ./dock.sh --script-help"
fi

exit $exit_status

