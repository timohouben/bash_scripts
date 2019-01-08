# script to replace the last line of all [^r]*.txt files in all
# directories and subdirectories with the second last line

for D in `find . -maxdepth 1 -type d`;
do
  pushd $D;
  echo "==> DIR ${D}";
  for i in [^r]*.txt;
  do
    head -n -1 $i > $i.temp;
    tail -1 $i.temp >> $i.temp;
    mv $i.temp $i;
  done;
  popd;
done
