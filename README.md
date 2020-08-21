# Soccer Statistics

Soccer Statistics

# Installation (Linux)

## MySQL Database Setup

1.- Install MySQL using these [instructions](https://support.rackspace.com/how-to/install-mysql-server-on-the-ubuntu-operating-system/).

2.- Configure MySQL Workbench GUI [here](https://www.linode.com/docs/databases/mysql/install-and-configure-mysql-workbench-on-ubuntu/).

3 .- Add a new Database named `CitizenLab`.

4 .- Load `CitizenLab_20200807_170139.sql` into your database.


## Project Setup

1.- Install Flask `~$ pip install flask`

2.- Set up flask initial config `~$ export FLASK_APP=Dashboard`

3.- Load required packages `~$ pip install -r requirements.txt`

4.- Run app using `~$ flask run`
