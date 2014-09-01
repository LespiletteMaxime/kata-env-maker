#!/bin/bash
# kata generator

if [ $# -eq 0 ]
  then
    echo "Missing argument"
    echo "Usage : \$$0 folder"
    exit 1
fi
mkdir $1;
cd $1;
# Get gulpfile https://gist.github.com/laracasts/52a9f085408605a06400
echo -e "\e[32m + Downloading gulpfile.js ... \e[39m"
wget https://gist.githubusercontent.com/laracasts/52a9f085408605a06400/raw/693215b5c6943d786da1ef75d3f5322c2ffd8367/Gulpfile.js

echo -e "\e[32m + Downloading fail.png \e[39m" 
wget http://share.genealabs.com/preview/RNr6AmnML27EcKsGJmvf1Ek_6NZxcNI-uoQ9Ud2LLTtgsZcJ0ma_xccTpjdoC1Dvox82UlLq6OXgdWegqONceQ -O fail.png

echo -e "\e[32m + Init package.json \e[39m" 
echo '{
  "devDependencies": {
    "gulp": "^3.8.7",
    "gulp-notify": "^1.5.0",
    "gulp-phpspec": "^0.2.6",
    "gulp-run": "^1.6.4"
  }
}
'> package.json

echo -e "\e[32m + Installing package.json dependencies ... \e[39m"
npm install 

echo -e "\e[32m + Init composer.json \e[39m" 
echo '{
	"require": {
		"phpspec/phpspec" : "~2.0"
	},
	"autoload": {
		"psr-0": {
			"": "src"
		}
	}
}
'> composer.json

echo -e "\e[32m + Install composer requirements \e[39m"
composer install

echo -e "\e[32m + Kata environment ready in $1 \n All done now, phpspec describe something \e[39m"
