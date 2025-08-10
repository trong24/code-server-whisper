#!/bin/bash

# Start code-server with desired configuration
exec code-server \
  --bind-addr 0.0.0.0:8888 \
  --disable-telemetry \
  --disable-update-check \
  --disable-workspace-trust \
  --disable-getting-started-override \
  --auth none \
  /home/jovyan