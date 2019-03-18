#!/bin/bash
nohup scrapyd &
nohup logparser &
cd lianjia
scrapyd-deploy lianjia -p lianjia
cd ..
python /evaluation-system/manage.py runserver 0.0.0.0:5050