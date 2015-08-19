== README

Local Development
-----------------
Rails  version 4.2.1
Ruby version 2.2.2p95

Common commands are held in a file called ```.drnk_env```. Sym link this to your home folder and source it in bash_profile or zsh_rc to get the benefits of some functions and aliases specific to this project.


Deployment
----------
This app is deployed on heroku at drnkmxr.com.  To deploy push to master ```git push heroku master``` or to deploy a specific branch ```git push heroku branch-name:master```


Testing
-------
Testing and quality info is at codeclimate.com
run guard for testing


Database
--------
Postgres 9.4.4 on production 
Sqlite on Development


-------------------------------
This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
