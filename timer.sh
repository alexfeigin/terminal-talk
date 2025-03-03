#!/usr/bin/env bash

presentation_timer() {

local SECTIONS=(
    "CLI productivity and me (Alex)"
    "CLI productivity and you (the why, the how, the what)"
    "Modern terminal emulators (iTerm2)"
    "Package manager (brew)"
    "The shell (my case for investing in bash)"
    "Productivity tools (tmux, fzf, bat, fd, btop)"
    "Customizing your experience (dotfiles)"
    "All developers want the same thing (git aliases)"
    "Scripting a case for bash"
    "Live Coding (Automate a Task)"
    "Thanks"
  )
  local TIMINGS=(120 120 120 120 120 300 120 180 300 300 0)

  countdown() {
    local seconds=$1
    while [ "$seconds" -gt 0 ]; do
      printf "\r⏳ Time remaining: %02d:%02d " $((seconds / 60)) $((seconds % 60))
      sleep 1
      ((seconds--))
    done
    printf "\n"
  }

  clear
  echo " Presentation Timer Started "
  echo

  for i in "${!SECTIONS[@]}"; do
    echo "▶️  ${SECTIONS[i]} ($(( ${TIMINGS[i]} / 60 )) min)"
    countdown "${TIMINGS[i]}"
    tput bel # Terminal bell alert when time is up
    echo "⏭️  Moving to the next section..."
    sleep 2
  done

  echo "🎉 Presentation complete!"
}
