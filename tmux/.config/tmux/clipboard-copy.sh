#!/bin/sh
# Copy stdin to the system clipboard. Works on Wayland (wl-copy) and X11 (xclip/xsel).
#
# The tmux server is started by systemd at boot (tmux-continuum), i.e. before the
# graphical login, so it may lack WAYLAND_DISPLAY / XAUTHORITY. If so, pull the
# current values from the systemd user manager, which the desktop session keeps updated.
if [ -z "$WAYLAND_DISPLAY" ] && [ -z "$XAUTHORITY" ] && command -v systemctl >/dev/null 2>&1; then
    eval "$(systemctl --user show-environment 2>/dev/null \
        | grep -E '^(DISPLAY|WAYLAND_DISPLAY|XAUTHORITY)=' | sed 's/^/export /')"
fi

if [ -n "$WAYLAND_DISPLAY" ] && command -v wl-copy >/dev/null 2>&1; then
    exec wl-copy
elif command -v xclip >/dev/null 2>&1; then
    exec xclip -selection clipboard >/dev/null 2>&1
elif command -v xsel >/dev/null 2>&1; then
    exec xsel --clipboard --input
fi
echo "clipboard-copy.sh: no clipboard tool found (install wl-clipboard or xclip)" >&2
exit 1
