#!/bin/bash
echo "GPT-2 processing..."
folder="data/56007-7"
output="data/output-7"
model_name="355M"
# 124M  355M  774M
nsamples="12"
top_k="40"
length="250"
temperature="0.99"
python="python src/conditional_samples.py" 
ext=".gpt2.txt"

if [ ! -d ${folder} ]; then
	echo "No such folder"
	quit
fi
if [ ! -d ${output} ]; then
	mkdir ${output}
fi

for file in ${folder}/*; do
    base="$(basename "${file}")"
	if [ -f ${output}/${base}${ext} ]; then
		echo "Skipping ${file}"
		continue
	fi
	cp ${file} ${output}/${base}${ext}
	echo "cat ${file} | ${python} --model_name ${model_name} --nsamples ${nsamples} --top_k ${top_k} --length ${length} --temperature ${temperature} >> ${output}/${base}${ext}"
	cat ${file} | ${python} --model_name ${model_name} --nsamples ${nsamples} --top_k ${top_k} --length ${length} --temperature ${temperature} >> ${output}/${base}${ext}
done