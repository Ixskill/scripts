#!/bin/sh

B='#00000000'  # blank
C='#ffffff22'  # clear ish
D='#ff00ffcc'  # default
T='#ee00eeee'  # text
W='#880000bb'  # wrong
V='#bb00bbbb'  # verifying

i3lock \
	-e \
	-i /home/ade-sede/Wallpapers/hotline-miami-1.jpg \
	--insidevercolor=$C   \
	--ringvercolor=$V     \
	\
	--insidewrongcolor=$C \
	--ringwrongcolor=$W   \
	\
	--insidecolor=$B      \
	--ringcolor=$D        \
	--linecolor=$B        \
	--separatorcolor=$D   \
	\
	--verifcolor=$T        \
	--wrongcolor=$T        \
	--timecolor=$T        \
	--datecolor=$T        \
	--layoutcolor=$T      \
	--keyhlcolor=$W       \
	--bshlcolor=$W        \
	\
	--screen 1            \
	--blur 5              \
	--clock               \
	--indicator           \
	--timestr="%H:%M:%S"  \
	--datestr="%A, %m %Y" \
	--veriftext="Checking ..." \
	--wrongtext="Nope. Too bad !" \
