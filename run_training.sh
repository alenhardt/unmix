#!/bin/bash

python scripts/train.py --dataset sourcefolder --root /datasets --nb-channels 1 --bandwidth 16000 --nb-workers `nproc --all` --seq-dur 4 --target-dir speech --interferer-dirs noise --nb-train-samples 10000 --nb-valid-samples 100 --unidirectional --batch-size 128
