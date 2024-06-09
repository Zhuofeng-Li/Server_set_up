# Server Set Up

## Automatic set up

```bash
#!/bin/bash

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
pip3 install scikit-learn pandas matplotlib jupyter torch torch_geometric


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


