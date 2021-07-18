# What We Eating?
## Back-End Repo

## About this Project
We are here to help you make that dreaded decision: Where are we eating?
Simply provide your zip code and we will provide you a list of open restaurants.
Pick your top 3 and send that to your friends or family to vote on. We will tally the rankings and show you the winning restaurant. Let's go eat!

## Table of Contents

  - [Getting Started](#getting-started)
  - [Front-End Repo](#front-end-repos)
  - [Running the tests](#running-the-tests)
  - [Service Oriented Architecture](#service-oriented-architecture)
  - [DB Schema](#db-schema)
  - [Endpoints](#endpoints)
  - [Built With](#built-with)
  - [Versioning](#versioning)
  - [Authors](#authors)

## Getting Started

To get the web application running, please fork and clone down the repo.

## Other Repos

- What We Eating? Front-End Application
  - [Repo](https://github.com/WhatWeEating/front-end-wwe) | [Heroku]()

### Prerequisites

To run this application you will need Ruby 2.5.3 and Rails 5.2.6

### Installing

- Install the gem packages  
  `bundle install`

- Create the database
  `rails db{:drop, :create, :migrate}`

## Running the tests
RSpec testing suite is utilized for testing this application.
  `bundle exec rspec`

## Service Oriented Architecture
The following is a depiction of the overall service oriented architecture for this application which includes a JavaScript Front End application, a Rails Engine on the Back End that call out to Yelp's API.

## DB Schema
The following is a depiction of our Database Schema


## Endpoints
### Search Open Restaurants by Zip Code
`GET https://back-end-wwe.herokuapp.com/restaurants`
- **Required** params:
  - valid 5-digit zip code
  - unique event ID

<!-- Include example resquest and response here  -->

### Query Winning Restaurant Details
<!-- - **Required** query params:
  - `location`
  - `vintage` -->
<!-- Include example resquest and response here  -->

## Built With
- Ruby
- Rails
- GraphQL
- RSpec
- FactoryBot
- Faker


## Versioning
- Ruby 2.5.3
- Rails 5.2.6

## Authors
<!-- - **Ashish Malla**
| [GitHub](https://github.com/asiisii) |
  [LinkedIn](https://www.linkedin.com/in/adam-bowers-06a871209/) -->
- **Diana Buffone**
| [GitHub](https://github.com/Diana20920) |
[LinkedIn](https://www.linkedin.com/in/dianabuffone/)
- **Logan Anderson**
| [GitHub](https://github.com/loganjacob76)
<!-- - **Matt Craig**
| [GitHub](https://github.com/mcraig2342) |
- **Pat Findley**
|  [GitHub](https://github.com/Patfindley) |
    [LinkedIn](https://www.linkedin.com/in/patfindley/)
- **Robert DeRouin**
|    [GitHub](https://github.com/robertjosephderouin) |
    [LinkedIn](https://www.linkedin.com/in/robert-derouin-7a2601173/) -->
