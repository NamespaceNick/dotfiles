#!/usr/bin/env bash
# Clones personal repositories 
# NOTE: Make sure to add ssh key before running this file

git clone git@github.com:NicolasDWilliams/test-files.git $HOME/developer/test-files
echo "Test files repository has been cloned!"
git clone git@github.com:NicolasDWilliams/NicolasDWilliams.github.io.git $HOME/developer/portfolio
echo "Online portfolio repository has been cloned!"
	

echo "All personal repositories have been cloned!"
