for i in *;
do
	mkdir ${i}_results && cp ${i}/*.tec ${i}/*.ic ${i}/*.mfp ${i}/*.mmp ${i}/*.msh ${i}/*.num ${i}/*.out ${i}/*.pcs ${i}/*.rfd ${i}/*.st ${i}/*.tim ${i}/*.gli ${i}/*.bc ${i}_results;
done