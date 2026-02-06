#!/bin/bash

# สั่งติดตั้ง Driver 18 (สูตร Debian)
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
curl https://packages.microsoft.com/config/debian/11/prod.list > /etc/apt/sources.list.d/mssql-release.list
apt-get update
ACCEPT_EULA=Y apt-get install -y msodbcsql18 unixodbc-dev

# รัน App ของพี่ (แก้ 'myproject' เป็นชื่อโปรเจกต์พี่)
gunicorn --bind=0.0.0.0 --timeout 600 azure_project.wsgi