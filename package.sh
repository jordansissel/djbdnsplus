NAME=djbdnsplus
VERSION=$(awk '{print $2}' VERSION)

TMP="/tmp"
PACKAGE="$NAME-$VERSION"
DIR="${TMP}/${PACKAGE}"
rm -rf "$DIR"
mkdir "$DIR"

filelist=$(mktemp)
git ls-files | sed -e 's/^/+ /' > $filelist
echo "- *" >> $filelist
rsync -rt --filter ". $filelist" . $DIR
rm $filelist

tar -C $TMP -zcf ${PACKAGE}.tar.gz $PACKAGE
rm -r $DIR
echo "Package is ready: $PACKAGE.tar.gz"
