Robin's Fork of OpenAI GPT-2

Robin.Rowe@VentureHollywood.com 2020/8/19

## Windows 10 CPU (not GPU) Installation Instructions

OpenAI GPT-2 is Python and Tensorflow. Robin's bash scripts call python. Don't need to install Windows bash if invoking python directly.

- Install Windows git bash shell (not GUI)
```    https://git-scm.com/downloads
```
- Install Python 3.6.8 64-bit, not 32-bit, not any version except 3.6.8 
- During Python installer, click the box to add python to the Path.
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
    python download_model.py 124M
    python download_model.py 355M
    python download_model.py 774M
```
- Create an data directory and some subdirs. (The data directory is excluded in .gitignore, for your data.)
```bash
    mkdir data
    mkdir data/input
    mkdir data/output
```
- Create as many 1-paragraph input files in the input directory as you wish to process. GPT-2 is complete-my-thought predictive AI. Give it one paragraph of text as an input and it takes it from there. Make your input paragraph as concise and cogent as you can. GPT-2 will try to match it for style. Avoid padding with meaningless words in phrasing, such as, "There is...".
- Edit any of my bash scripts to meet your needs.
```bash
    vi bash/go_gpt2_99
```
- Run your script.
```bash
    sh bash/go_gpt2_99_124M.sh
```