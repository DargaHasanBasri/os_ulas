if ["$1" = "force"]
then
  flutter packages pub run build_runner --delete-conflicting-outputs
else
  flutter packages pub run build_runner build
fi