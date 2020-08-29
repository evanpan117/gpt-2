# Robin's Fork of OpenAI GPT-2

Robin.Rowe@VentureHollywood.com 2020/8/19

If you're seeking a fork of GPT-2 that is being maintained, that you may actually use because it works, you've come to the right place. This is the software that's had articles written about students using it to write their term papers. I'm using GPT-2 running on a nothing special Windows 10 laptop to help me write a standards document on innovation idea management (ANSI/ISO 56007).

GPT-2 is written in Python. I created conditional_samples.py and some bash scripts that make it easy to do production runs of GPT-2. It just needs a directory of input text files for GPT-2 to process and an empty output directory. If you follow my installation instructions here, you can use GPT-2 without being a programmer. Just tweak the settings in one of my example bash scripts to point to your directory locations. There are three different size ML models provided. If the smallest doesn't give output text you like, try larger.

GPT-2 is a complete-my-thought type of AI. In my Hello World example below, I've provided the first two lines of input to GPT-2. The output is what GPT-2 did with it. Pretty cool. By the way, if you are seeking the source code of GPT-3, you won't find it anywhere: https://onezero.medium.com/gpt-3-is-an-amazing-research-tool-openai-isnt-sharing-the-code-d048ba39bbfd

## GPT-2 "Hello World"

### Robin's Input

Mary had a little lamb. Its fleece was white as snow.

### GPT-2 Output

She hated snow. Charles was reportedly so terrified during the incident that he ran to his girlfriend and began weeping. She slept with it, just like I want to do to my darling Rachel. I doubted she would wake. Her nose was a pair of fluffy white eyes, filled with love. It wasn't good. In strange ways, she had cherished and gotten into all the lovers she had loved. But she'd never felt loved completely like she would if she had been a marriageable woman.

## GPT-2 Windows 10 CPU (not GPU) Installation Instructions

OpenAI GPT-2 is Python and Tensorflow. GPT-2 requires specific versions of Python and Tensorflow. It doesn't work with the latest versions of those programs. Robin's bash scripts call python. Don't need to install Windows bash if invoking python directly.

- Install Windows git bash shell (not GUI)
```
    https://git-scm.com/downloads
```
- Install Python 3.6.8 64-bit, not 32-bit, not any version except 3.6.8 64-bit, because it must match up with specific version of Tensorflow.
- During Python installer, click the box to add python to the Path.
- Clone GPT-2 robinrowe fork.
```bash
    git clone https://github.com/robinrowe/gpt-2
    cd gpt-2  
    python --version
```
- Python 3.6.8 (not any other Python!)
```bash
    python -m pip install --upgrade pip
    pip install tensorflow==1.15.3
    pip install -r requirements.txt
```
- Download corpus models. The 124M model is fine. Download larger models or all three if you wish. They won't collide.
```bash
    python src/download_model.py 124M
    python src/download_model.py 355M
    python src/download_model.py 774M
```
- Create a data directory and some subdirs for input and output text files. By the way, the data directory is already excluded in .gitignore, is intended to be only for your data.
```bash
    mkdir data
    mkdir data/input
    mkdir data/output
```
- Create as many 1-paragraph input files in the input directory as you wish to process. GPT-2 is complete-my-thought predictive AI. Give it one paragraph of text as an input and it takes it from there. Make your input paragraph as concise and cogent as you can. GPT-2 will try to match it for style. Avoid padding with meaningless words in phrasing, such as, "There is...".
- Edit the settings any of my bash scripts to meet your needs.
```bash
    vi bash/go_gpt2_99_124M.sh
```
- Run your script.
```bash
    sh bash/go_gpt2_99_124M.sh
```
