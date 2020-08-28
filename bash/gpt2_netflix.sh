#!/bin/bash
echo "GPT-2 processing..."
folder="data/netflix"
output="data/netflix-out"
model_name="124M"
# 124M  355M  774M
nsamples="6"
top_k="40"
length="400"
temperature="0.99"
python="python src/conditional_samples.py" 

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
	cp ${file} ${output}/${base}.out
	echo "cat ${file} | ${python} --model_name ${model_name} --nsamples ${nsamples} --top_k ${top_k} --length ${length} --temperature ${temperature} >> ${output}/${base}.out"
	cat ${file} | ${python} --model_name ${model_name} --nsamples ${nsamples} --top_k ${top_k} --length ${length} --temperature ${temperature} >> ${output}/${base}.out
done