#!/usr/bin/env bash

# ~/pydata.sh

# Removed user's cached credentials
# This script might be run with .dots, which uses elevated privileges
sudo -K

echo "------------------------------"
echo "Setting up anaconda"

# You can change what anaconda version you want at 
# https://repo.continuum.io/archive/
curl https://repo.continuum.io/archive/Anaconda3-5.2.0-MacOSX-x86_64.sh -o anaconda3.sh
bash anaconda3.sh -b -p ~/anaconda3
rm anaconda3.sh
echo 'export PATH="~/anaconda3/bin:$PATH"' >> ~/.bash_profile 
# Refresh basically
source .bash_profile
conda install tensorflow
conda install yapf
conda update conda

echo "------------------------------"
echo "Setting up pip."

# Install pip
easy_install pip

###############################################################################
# Virtual Enviroments                                                         #
###############################################################################

echo "------------------------------"
echo "Setting up virtual environments."

# Install virtual environments globally
# It fails to install virtualenv if PIP_REQUIRE_VIRTUALENV was true
export PIP_REQUIRE_VIRTUALENV=false
pip install virtualenv
pip install virtualenvwrapper

echo "------------------------------"
echo "Source virtualenvwrapper from ~/.extra"

EXTRA_PATH=~/.extra
echo $EXTRA_PATH
echo "" >> $EXTRA_PATH
echo "" >> $EXTRA_PATH
echo "# Source virtualenvwrapper, added by pydata.sh" >> $EXTRA_PATH
echo "export VIRTUALENVWRAPPER_PYTHON=~/anaconda3/bin/python" >> $EXTRA_PATH
echo "export WORKON_HOME=~/.virtualenvs" >> $EXTRA_PATH
echo "source ~/anaconda3/bin/virtualenvwrapper.sh" >> $EXTRA_PATH
echo "" >> $BASH_PROFILE_PATH
source $EXTRA_PATH

###############################################################################
# Python 2 Virtual Enviroment                                                 #
###############################################################################

echo "------------------------------"
echo "Setting up py2-data virtual environment."

# Create a Python2 data environment
mkvirtualenv py2-data
workon py2-data

# Install Python data modules
pip install numpy
pip install scipy
pip install matplotlib
pip install pandas
pip install sympy
pip install nose
pip install unittest2
pip install seaborn
pip install scikit-learn
pip install "ipython[all]"
pip install bokeh
pip install Flask
pip install sqlalchemy
pip install mysql-python

pip install requests
pip install scrapy
pip install Pillow
pip install beautifulsoup4
pip install opencv-python
pip install mechanize
pip install lxml
pip install --upgrade autopep8
pip install selenium
pip install apscheduler

###############################################################################
# Python 3                                                                    #
###############################################################################

echo "------------------------------"
echo "Setting up py3-data virtual environment."

# Create a Python3 data environment
mkvirtualenv --python=/usr/local/bin/python3 py3-data
workon py3-data

# Install Python data modules
pip install numpy
pip install scipy
pip install matplotlib
pip install pandas
pip install sympy
pip install nose
pip install unittest2
pip install seaborn
pip install scikit-learn
pip install "ipython[all]"
pip install bokeh
pip install Flask
pip install sqlalchemy
#pip install mysql-python  # Python 2 only, use mysqlclient instead
pip install mysqlclient

pip install tensorflow
pip install requests
pip install scrapy
pip install Pillow
pip install beautifulsoup4
pip install opencv-python
pip install MechanicalSoup
pip install lxml
pip install --upgrade autopep8
pip install selenium
pip install apscheduler
###############################################################################
# Install IPython Profile
###############################################################################

echo "------------------------------"
echo "Installing IPython Notebook Default Profile"

# Add the IPython profile
mkdir -p ~/.ipython
cp -r init/profile_default/ ~/.ipython/profile_default

echo "------------------------------"
echo "Script completed."
echo "Usage: workon py2-data for Python2"
echo "Usage: workon py3-data for Python3"
