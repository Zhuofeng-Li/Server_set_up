# Server Set Up

## Requirements
### Cuda 
**Nvidia:** Check [https://docs.nvidia.com/cuda/cuda-installation-guide-linux/](https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=22.04&target_type=deb_local)

### Mini conda Env setup

```bash
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init bash
~/miniconda3/bin/conda init zsh
```

### Mini conda Env create
```bash
conda create --name NAME
conda activate NAME
```

### Packages setup

```bash
#!/bin/bash

sudo apt-get update

# Check and install Python
if ! command -v python3 &> /dev/null
then
    echo "Python3 is not installed. Installing Python3..."
    sudo apt-get update
    sudo apt-get install -y python3
else
    echo "Python3 is already installed."
fi

# Check and install pip
if ! command -v pip3 &> /dev/null
then
    echo "pip is not installed. Installing pip..."
    sudo apt-get install -y python3-pip
else
    echo "pip is already installed."
fi

# Use pip to install the required libraries
echo "Installing required libraries: numpy scikit-learn, pandas, matplotlib, jupyter torch..."
# ML package 
pip3 install scikit-learn numpy pandas matplotlib jupyter
# DL package
pip3 install torch transformers datasets accelerate evaluate
# Log
pip2 install tensorboard wandb 


# Create a symbolic link for python to python3 if it doesn't exist
if ! command -v python &> /dev/null
then
    echo "Creating a symbolic link from python to python3..."
    sudo ln -s /usr/bin/python3 /usr/bin/python
else
    echo "python is already linked to $(python --version)"
fi

# install fish shell
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish

# Append the alias 'ts' to the end of the .bashrc file
echo "alias tn='tmux new -s'" >> ~/.bashrc && source ~/.bashrc

# Append the alias 'tt' to the end of the .bashrc file
echo "alias ta='tmux attach -t'" >> ~/.bashrc && source ~/.bashrc

# Append the alias 'ns' to the end of the .bashrc file
echo "alias ns='nvidia-smi'" >> ~/.bashrc && source ~/.bashrc

echo "alias ca='conda activate'" >> ~/.bashrc && source ~/.bashrc

echo "alias ga='git add'" >> ~/.bashrc && source ~/.bashrc

echo "alias gc='git commit'" >> ~/.bashrc && source ~/.bashrc

echo "alias go='git log'" >> ~/.bashrc && source ~/.bashrc

```

### Vscode extensions setup
```bash
#!/bin/bash

code --install-extension github.copilot
code --install-extension github.copilot-chat
code --install-extension ms-python.debugpy
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension ms-toolsai.jupyter
code --install-extension ms-toolsai.jupyter-keymap
code --install-extension ms-toolsai.jupyter-renderers
code --install-extension ms-toolsai.vscode-jupyter-cell-tags
code --install-extension ms-toolsai.vscode-jupyter-slideshow
code --install-extension  gruntfuggly.todo-tree
code --install-extension  ms-python.black-formatter
```
### Additional set up 

**torch:** Check https://pytorch.org/get-started/locally/

**PyG:** Check https://pytorch-geometric.readthedocs.io/en/latest/notes/installation.html

### Useful tips
+ **delete all GPU processes:**
```python
lsof /dev/nvidia* | awk '{print $2}' | xargs -I {} kill {}
```

## Huggingface
### Login
```python
huggingface-cli login
```
### Download dataset
**Download the file:**
```python
from huggingface_hub import hf_hub_download
file_path = hf_hub_download(repo_id="Zixing-GOU/TEG-DB", subfolder="Goodreads-History/raw", filename="goodreads_history_graph1.pkl.zip", repo_type="dataset", local_dir=".")
```

**Download the dir:**
```python
from huggingface_hub import snapshot_download
snapshot_download(repo_id="ZhuofengLi/TEG-Datasets", repo_type="dataset", local_dir="../Dataset", token="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")
```
### Upload dataset

```python
from huggingface_hub import HfApi

api = HfApi()

api.upload_file(
    path_or_fileobj="hisotry_gpt_edges_0.pkl",
    path_in_repo="./hisotry_gpt_edges_0.pkl",
    repo_id="ZhuofengLi/TEG-Dataset",
    repo_type="dataset",
    token="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"
)
```

### Download dataset

```python
from huggingface_hub import snapshot_download

snapshot_download(repo_id="ZhuofengLi/TEG-Datasets", repo_type="dataset", local_dir="../Dataset")
```

## Cloud Setup
### Google Cloud Start
```bash
gcloud compute config-ssh
```
### Setup the local and remote connection
```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
cat ～/.ssh/id_rsa.pub
# copy id_rsa.pub to the remote `~/.ssh/authorized_keys`
```


