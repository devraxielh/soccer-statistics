# Soccer Statistics

Sentiment Analysis made over soccer statistics.

# Installation (Linux)

## MySQL Database Setup

1.- Install MySQL using these [instructions](https://support.rackspace.com/how-to/install-mysql-server-on-the-ubuntu-operating-system/).

2.- Configure MySQL Workbench GUI [here](https://www.linode.com/docs/databases/mysql/install-and-configure-mysql-workbench-on-ubuntu/).

3 .- Add a new Database named `CitizenLab`.

4 .- Load `CitizenLab_XXXXXXX.sql` into your database.

## Project Setup (Development)

1.- Install Flask `~$ pip install flask`

2.- Set up flask initial config `~$ export FLASK_APP=Dashboard` and `~$ export FLASK_ENV=development`.

3.- Load required packages `~$ pip install -r requirements.txt`

4.- Run app using `~$ flask run`

# Pending tasks

- [ ] Correlation Analysis using real data.
- [ ] Solve Matplotlib issue during Dockerization.
- [ ] Docker deployment into selected cloud service.