#!/usr/bin/env bash

# ~/pydata.sh

# Removed user's cached credentials
# This script might be run with .dots, which uses elevated privileges
sudo -K

echo "------------------------------"
echo "Setting up pip."

# Install pip
easy_install pip


###############################################################################
# Python 2                                                                    #
###############################################################################

echo "------------------------------"
echo "Setting up py2 environment."


# Install Python data modules
pip2 install numpy
pip2 install scipy
pip2 install matplotlib
pip2 install pandas
pip2 install sympy
pip2 install nose
pip2 install unittest2
pip2 install seaborn
pip2 install scikit-learn
pip2 install "ipython[all]"
pip2 install bokeh
pip2 install Flask
pip2 install sqlalchemy
pip2 install mysql-python

pip2 install requests
pip2 install scrapy
pip2 install Pillow
pip2 install beautifulsoup4
pip2 install opencv-python
pip2 install mechanize
pip2 install lxml
pip2 install --upgrade autopep8
pip2 install selenium
pip2 install apscheduler

###############################################################################
# Python 3                                                                    #
###############################################################################

echo "------------------------------"
echo "Setting up py3 environment."

# Install Python data modules
pip3 install numpy
pip3 install scipy
pip3 install matplotlib
pip3 install pandas
pip3 install sympy
pip3 install nose
pip3 install unittest2
pip3 install seaborn
pip3 install scikit-learn
pip3 install "ipython[all]"
pip3 install bokeh
pip3 install Flask
pip3 install sqlalchemy
#pip install mysql-python  # Python 2 only, use mysqlclient instead
pip3 install mysqlclient

pip3 install requests
pip3 install scrapy
pip3 install Pillow
pip3 install beautifulsoup4
pip3 install opencv-python
pip3 install lxml
pip3 install --upgrade autopep8
pip3 install selenium
pip3 install apscheduler
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
