#!/bin/bash

set -e  # Exit immediately if any command fails

echo "[BUILD] Cleaning old builds..."
rm -rf build dist hathaway_analytics.egg-info

echo "[BUILD] Rebuilding package..."
python -m build

echo "[BUILD] Reinstalling package..."
WHEEL=$(ls dist/hathaway_analytics-*.whl | sort -V | tail -n 1)
pip install --force-reinstall "$WHEEL"

echo "[BUILD] Done. Installed:"
pip show hathaway-analytics | grep -E 'Name|Version|Location'
