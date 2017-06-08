#!/bin/bash

chuckfile="./chuckjoke.data"
weatherfile="./summary.data"

ruby weather.rb &
#ruby chuck.rb &

while true; do
  WEATHER=$(cat ./summary.data)
#  CHUCK=$(cat ./chuckjoke.data)
  TODAY=$(date)
  HOST=$(hostname)

  clear

#  echo "\n\n\n\n\n\n\n\n\n\n\n"
  echo ""
  echo "---------------------------------------"
  echo ""
  echo "               Date:" 
  echo "   $TODAY"
  echo ""
#  echo "Chuck Joke: $CHUCK"
  echo "          Weather Summary:" 
  echo "  $WEATHER"
  echo ""
  echo ""
  echo ""
  echo ""
  echo ""
  echo "---------------------------------------"
  
  sleep 3
done
