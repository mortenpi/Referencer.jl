#!/bin/bash

# Should be called as
#   ./serve.sh <port>
# and then the browser should be directed at
#   localhost:<port>/ui.html

exec python -m SimpleHTTPServer $@
