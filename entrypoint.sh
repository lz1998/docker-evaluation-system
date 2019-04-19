#!/bin/bash
nohup scrapyd &
sleep 5s
nohup logparser &
sleep 5s
cd lianjia
scrapyd-deploy lianjia -p lianjia
cd ..
python /evaluation-system/manage.py runserver 0.0.0.0:5050
