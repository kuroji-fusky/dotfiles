$dDrive = "d/Github/"

pushDeezNuts() {
  cd $1
  echo "Pushing to $1"
  cd -
  git push origin master
}