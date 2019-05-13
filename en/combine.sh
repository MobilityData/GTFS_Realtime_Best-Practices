rm -f index.md
touch index.md
BEST_PRACTICES_FILES=(introduction FeedHeader FeedEntity TripUpdate StopTimeUpdate StopTimeEvent VehiclePosition Position Alert TripDescriptor VehicleDescriptor Frequency-based about)
for i in "${BEST_PRACTICES_FILES[@]}"
do
  cat ./en/$i.md >> index.md
done
