# Server Set Up

## Requirements
### Automatic set up

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
echo "Installing required libraries: scikit-learn, pandas, matplotlib, jupyter torch torch_geometric..."
pip3 install scikit-learn pandas matplotlib jupyter torch torch_geometric huggingface_hub


# Create a symbolic link for python to python3 if it doesn't exist
if ! command -v python &> /dev/null
then
    echo "Creating a symbolic link from python to python3..."
    sudo ln -s /usr/bin/python3 /usr/bin/python
else
    echo "python is already linked to $(python --version)"
fi

# Append the alias 'ts' to the end of the .bashrc file
echo "alias ts='tmux new -s'" >> ~/.bashrc && source ~/.bashrc

# Append the alias 'tt' to the end of the .bashrc file
echo "alias tt='tmux attach -t'" >> ~/.bashrc && source ~/.bashrc
```

### set up 

**Nvidia: **Check https://docs.nvidia.com/cuda/cuda-installation-guide-linux/

**torch: ** Check https://pytorch.org/get-started/locally/

**PyG: **Check https://pytorch-geometric.readthedocs.io/en/latest/notes/installation.html



## Huggingface

### Download dataset

```python
from huggingface_hub import hf_hub_download

# Download the file
file_path = hf_hub_download(repo_id="Zixing-GOU/TEG-DB", subfolder="Goodreads-History/raw", filename="goodreads_history_graph1.pkl.zip", repo_type="dataset", local_dir=".")

print(f"File downloaded to {file_path}")
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


