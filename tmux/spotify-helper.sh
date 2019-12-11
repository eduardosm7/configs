#/bin/bash

SPOTIFY_ARTIST=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:org.mpris.MediaPlayer2.Player string:Metadata | grep -A 2 artist | tail -n1 | cut -d '"' -f 2)

SPOTIFY_SONG=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:org.mpris.MediaPlayer2.Player string:Metadata | grep -A 1 title | tail -n1 | cut -d '"' -f 2)

echo -e "$SPOTIFY_SONG : $SPOTIFY_ARTIST"

