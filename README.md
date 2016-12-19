# _Shoe Distribution_

#### By _**Haley Swain**, 12/16/2016_

## Description
* This is a program that will allow the user to track shoe brands and what stores they are in.


**User Stories**

* As a user, I want to be able to add, update, delete and list shoe stores.
* As a user, I want to be able to add and list new shoe brands.
* As a user, I want to be able to add shoe brands in the application (don't worry about updating, listing or destroying shoe brands).
* As a user, I want to be able to add existing shoe brands to a store to show where they are sold.
* As a user, I want to be able to associate the same brand of shoes with multiple stores.
* As a user, I want to be able to see all of the brands a store sells on the individual store page.
* As a user, I want store names and shoe brands to be saved with a capital letter no matter how I enter them.
* As a user, I do not want stores and shoes to be saved if I enter a blank name.

## Setup/Installation Requirements

* Clone this repo: `git clone https://github.com/haleyswain/shoe-distribution.git`
* Change to the repo directory: `cd {shoe_distribution}`
* Install gems: 'bundle install'
* Run the app: `ruby app.rb`

## Database Setup Instructions

* install and start postgres
* run: `bundle exec rake db:create`
* run: `bundle exec rake db:migrate`
* run: `bundle exec rake db:test:prepare`

## Technologies Used

_Ruby, Sinatra, SQL, Postgres, JavaScript, MaterializeCSS_

### License

*MIT License*

Copyright (c) 2016 **_Haley Swain _**
