if [ $# -eq 0 ]
  then
    echo "No project name provided"
    exit 1
fi
openEditor=false
projName=$1
shift

# Check flags
while test $# -gt 0; do
  case "$1" in
    -h|--help)
        echo "This is the help flag"
        exit 0
        ;;
    -a)
        openEditor=true
        shift
        ;;
    *)
        break
        ;;
  esac
done

echo "Creating sketch..."
mkdir $projName
cd $projName
touch $projName.pde
echo "void setup() {
    size(960, 640);
}

void draw() {
    background(255);
}" >> $projName.pde
touch .gitignore
echo "build/*" >> .gitignore

if [ "$openEditor"=true ]; then
  #statements
  echo "Opening project in Atom..."
  atom ../$projName
fi
