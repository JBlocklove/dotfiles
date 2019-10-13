#!/bin/bash

notify-send --icon=appointment-soon-symbolic Calcurse "$(calcurse -n)"


# UNCOMMENT FOR EMAILS
#nextAppt="$(calcurse -n)"
#apptSchedule="$(calcurse -a)"
#
#message="$nextAppt\n\n\n$apptSchedule"
#
#echo -e "$message" | mail -s "[Calcurse] Upcoming Appt." jason.blocklove@gmail.com
