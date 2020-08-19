#!/bin/bash
echo "GPT-2 processing..."
folder="56007"
output="output-99-124"
model_name="124M"
# 124M  355M  774M
nsamples="12"
top_k="40"
length="200"
temperature="0.99" 

if [ ! -d ${folder} ]; then
	echo "No such folder"
	quit
fi
if [ ! -d ${output} ]; then
	mkdir ${output}
fi

for file in ${folder}/*; do
    base="$(basename "${file}")"
	if [ -f ${output}/${base}.out ]; then
		echo "Skipping ${file}"
		continue
	fi
	${output}/${base}.out
	cp ${file} ${output}/${base}.out
	echo "cat ${file} | python src/conditional_samples.py --model_name ${model_name} --nsamples ${nsamples} --top_k ${top_k} --length ${length} --temperature ${temperature} >> ${output}/${base}.out"
	cat ${file} | python src/conditional_samples.py --model_name ${model_name} --nsamples ${nsamples} --top_k ${top_k} --length ${length} --temperature ${temperature} >> ${output}/${base}.out
done