#!/bin/bash

python scripts/train.py --dataset sourcefolder --root /datasets --nb-channels 1 --bandwidth 16000 --nb-workers 4 --seq-dur 3 --target-dir clean --interferer-dirs noise --nb-train-samples 1000
