A Django Rest Framework for a time management system. A demo is available at:
https://www.mephistosoftware.com/scheduler/

It uses an Angular 6 front end. This front end is available at:
https://github.com/eddyod/scheduler
Configuration of Project Environment
*************************************

This is a python Django project using postgestql

Overview on how to run this module
================================
1. Install a Python virtualenv
2. Install packages required
3. Have access to the postgres server
4. Have access to a linux server that can access the databases

Setup procedure
================

A. Configure
------------------------------------------------------------------------------------------------

1. Create a Python Virtual Environment
    - Make the dir if it doesn't exist:

        mkdir ~/.virtualenvs
        

    - Create virtualenv (note, I use the word rester below, it can be anything)

        python3 -m venv ~/.virtualenvs/rester
        
    - Activate virtualenv 

        source ~/.virtualenvs/rester/bin/activate

    - Install requirements::

        pip install -r requirements.txt


B. Edit settings.py 
---------------

    Edit the rester/settings.py file.
    - add username, password and host of the postgresql database you
    are using
    
