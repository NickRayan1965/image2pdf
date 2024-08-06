@echo off
start "" /B java -jar C:\ImageTools\image_tools.jar
start "" /B http-server C:\ImageTools\dist
exit