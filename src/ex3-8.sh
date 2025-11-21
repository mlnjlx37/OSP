#!/bin/sh

DB_DIR="DB"
TRATH_DIR="train"
ARCHIVE_NAME="db_archive.tar.gz"


echo "현재 경로에서 DB라는 폴더가 있는지 확인하고 없다면 생성"

if [ ! -d "$DB_DIR" ]; then
	mkdir "$DB_DIR"
	echo "Directory '$DB_DIR' created."
else
	echo "Directory '$DB_DIR' already exists."

fi

echo "임의의 5개 파일을 만들고 압축하기"

cd "$DB_DIR" || exit 1

FILE_LIST=""
for i in 1 2 3 4 5; do
	FILE_NAME="data_${i}.txt"
	touch "$FILE_NAME"
	FILE_LIST="$FILE_LIST $FILE_NAME"
done

echo "Created 5 files."

tar -czf "$ARCHIVE_NAME" $FILE_LIST
echo "Files compressed into '$ARCHIVE_NAME'."

cd ..

echo "train이라는 폴더를 생성하고 DB에 있는 파일 5개만 링크"

mkdir -p "$TRATH_DIR"
echo "Directory '$TRATH_DIR' created."

for i in 1 2 3 4 5; do
	SOURCE_PATH="../$DB_DIR/data_${i}.txt"
	LINK_NAME="$TRATH_DIR/link_data_${i}.txt"

	ln -s "$SOURCE_PATH" "$LINK_NAME"
	echo "Created symlink: $LINK_NAME -> $SOURCE_PATH"
done

exit 0

