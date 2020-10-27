# Allow italics in terminal
touch xterm-256color.terminfo.txt
echo "xterm-256color|xterm with 256 colors and italic,
  sitm=\E[3m, ritm=\E[23m,
  use=xterm-256color," > xterm-256color.terminfo.txt

tic -o ~/.terminfo xterm-256color.terminfo.txt

rm xterm-256color.terminfo.txt

