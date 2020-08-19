#!/bin/bash
echo "GPT-2 processing..."
folder="56007"
output="output-75-355"
model_name="355M"
nsamples="12"
top_k="40"
length="120"
temperature="0.75" 

if [ ! -d ${folder} ]; then
	echo "No such folder"
	quit
fi
if [ ! -d ${output} ]; then
	mkdir ${output}
fi

for file in ${folder}/*; do
    base="$(basename "${file}")"
	cp ${file} ${output}/${base}.out
	echo "cat ${file} | python src/conditional_samples.py --model_name ${model_name} --nsamples ${nsamples} --top_k ${top_k} --length ${length} --temperature ${temperature} >> ${output}/${base}.out"
	cat ${file} | python src/conditional_samples.py --model_name ${model_name} --nsamples ${nsamples} --top_k ${top_k} --length ${length} --temperature ${temperature} >> ${output}/${base}.out
done