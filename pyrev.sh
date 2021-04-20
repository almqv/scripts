#!/bin/sh

text=$1

python -c "print('$text'[::-1])" > /tmp/pyrev.txt && figlet $(cat /tmp/pyrev.txt) && rm /tmp/pyrev.txt

