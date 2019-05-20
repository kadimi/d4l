# D4L (Docker for Laravel)


## Setup Instructions

### #0. TLDR;

0. Open a terminal
0. `cd` into the direcoty where you want to place your project (e.g. `~/Desktop`)
0. Copy #1, #2, and #3 from this page [all at once](https://i.imgur.com/uXwzS7Y.png), including normal text, it will be ignored
0. Paste into terminal and press `↩` 
0. [Wait](https://github.com/hirak/prestissimo)
0. Go to [step #4](#4-Access-Services)

### #1. Clone Repository

```sh
git clone git@github.com:kadimi/d4l.git
cd d4l
```

### #2. Setup Laravel

```sh
# Download and setup Laravel.
composer create-project laravel/laravel laravel

# Use correct directory permissions.
chmod -R 777 laravel/storage laravel/bootstrap/cache
```

### #3. Boot Docker Containers

```sh
docker-compose up --build
```

### #4. Access Services

* [App (localhost:9000)](http://localhost:9000)
* [Database (localhost:8080)](http://localhost:8080/?sqlite&db=/var/www/html/database/database.sqlite), (system is `SQLite 3` and password is `laravel`)
