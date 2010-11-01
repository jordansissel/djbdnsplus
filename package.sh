VERSION=1.05.01
PACKAGE=djbdnsplus

TMP="/tmp"
PACKAGE="$PACKAGE-$VERSION"
DIR="${TMP}/${PACKAGE}"
rm -rf "$DIR"
mkdir "$DIR"

filelist=$(mktemp)
git ls-files | sed -e 's/^/+ /' > $filelist
echo "- *" >> $filelist
rsync -rtv --filter ". $filelist" . $DIR
rm $filelist

tar -C $TMP -zcf ${PACKAGE}.tar.gz $PACKAGE
rm -r $DIR
