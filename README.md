# "What We Eating?" Back-End

## About this Project
We are here to help you make that dreaded decision: **Where are we eating?**
Provide your zip code and we will show you a list of open restaurants.
Pick your top 3 and share them with your friends or family to get their 1st, 2nd, and 3rd choice. We will tally the rankings and show you all the winning restaurant. Let's go eat!


This repo houses **What We Eatin'?** Back-End. It has a combination of ReST API and GraphQL API, both built with Ruby on Rails and PostgreSQL. It provides data from Yelp API and logic to a React Front-End.


## Table of Contents

  - [Getting Started](#getting-started)
  - [Front-End Repo](#front-end-repo)
  - [Running the tests](#running-the-tests)
  - [Architecture](#architecture)
  - [DB Schema](#db-schema)
  - [Endpoints](#endpoints)
  - [Built With](#built-with)
  - [Versioning](#versioning)
  - [Authors](#authors)

## Getting Started

To get your local/development environment running, please fork and clone down the repo:
  ```shell
  $ git clone git@github.com:WhatWeEating/back-end-wwe.git
  ```

## Front-End Repo

-  You can find more information about the application at [GitHub Repo](https://github.com/WhatWeEating/front-end-wwe)
- Visit the deployed application on [Heroku](https://mysterious-cove-94790.herokuapp.com/)

### Prerequisites

To run this application you will need Ruby 2.5.3 and Rails 5.2.6

### Installing
Once you have forked and cloned the repo:
- Install the gem packages using [Bundler](https://bundler.io/)
  ```shell
  $ cd back-end-wwe
  $ bundle install
  ```

- Start with a clean database
  ```shell
  $ rails db:{drop,create,migrate,seed}
  ```

## Running the tests
RSpec testing suite is utilized for testing this application.
- Run the test suite and access test coverage files
  ```shell
  $ bundle exec rspec
  $ open coverage/index.html
  ```

## Architecture
The following is a depiction of the overall architecture for this application which includes a JavaScript Front-End application and a Rails Engine on the Back-End that calls out to Yelp's API.

![](assets/README-3fa451ab.jpg)

## DB Schema
The following is a depiction of our Database Schema

![](assets/README-b48ee49d.jpg)

## Endpoints
### 1. Search Open Restaurants by Zip Code
  `GET https://back-end-wwe.herokuapp.com/restaurants?zip=<5-digit-code>`
  - **Required** params: valid 5-digit zip code
  - **Required** headers: unique event ID
  - **Limited** results: 15 restaurants

<details>
<summary>Example response (expand)</summary>

  ```json
  {
    "data": [
        {
            "id": "AKqb9TR9QdzJ1qdu8tkTzA",
            "type": "restaurant",
            "attributes": {
                "name": "Hair of the Dog Eatery",
                "image": "https://s3-media3.fl.yelpcdn.com/bphoto/gwaFPzFHysAIJ6e5YC2exQ/o.jpg",
                "rating": 4.0,
                "price": "$$",
                "address": "4000 Virginia Beach Blvd, Ste 210, Virginia Beach, VA 23452",
                "phone": "(757) 321-2200"
            }
        },
        {
            "id": "BfRDJuCXGJTYspHHgEN4zg",
            "type": "restaurant",
            "attributes": {
                "name": "Mazari Kebab and More",
                "image": "https://s3-media2.fl.yelpcdn.com/bphoto/O8HcqBaWHv_oHQ5U5wk6IA/o.jpg",
                "rating": 4.5,
                "price": "$$",
                "address": "676 N Witchduck Rd, Virginia Beach, VA 23462",
                "phone": "(757) 961-5968"
            }
        },
        {
            "id": "HH0O-DJNF34-SMmhKkK-AA",
            "type": "restaurant",
            "attributes": {
                "name": "The Route 58 Delicatessen",
                "image": "https://s3-media4.fl.yelpcdn.com/bphoto/SWhB05QOOBLuhk5Sw9uylw/o.jpg",
                "rating": 4.5,
                "price": "$$",
                "address": "4000 Virginia Beach Blvd, Ste 156, Virginia Beach, VA 23462",
                "phone": "(757) 227-5868"
            }
        }
      ]
    }
  ```
</details>

### 2. Create Top 3 Restaurants Mutation
`POST https://back-end-wwe.herokuapp.com/graphql`
<details>
<summary>Example query (expand)</summary>

  ```
  mutation {
        createRestaurants(input: {
          params: {
            first: {
              eventId: "1234500",
              yelpId: "f00d1sLyf311",
              image: "website",
              address: "578 st",
              phone: "125405648",
              name: "Cuisine All"
            },
            second: {
              eventId: "1234500",
              yelpId: "Gr2bs00menOMNoms",
              image: "webpage",
              address: "3 ave",
              phone: "458405648",
              name: "All the Yums"
            },
            third:{
              eventId: "1234500",
              yelpId: "suPP0fd2D2y",
              image: "imageaddress",
              address: "5 st",
              phone: "966405648",
              name: "Nom Noms for Dayz"
            }
            }}) {
      restaurant {
        name
        phone
        address
        votes
      }
    }
  }
  ```
</details>

<details>
<summary>Example response (expand)</summary>

```json
{
  "data": {
    "createRestaurants": {
      "restaurant": [
        {
          "name": "Cuisine All",
          "phone": "125405648",
          "address": "578 st",
          "votes": 0
        },
        {
          "name": "All the Yums",
          "phone": "458405648",
          "address": "3 ave",
          "votes": 0
        },
        {
          "name": "Nom Noms for Dayz",
          "phone": "966405648",
          "address": "5 st",
          "votes": 0
        }
      ]
    }
  }
}
```
</details>

### 3. Update Votes for Top 3 Restaurants Mutation
`POST https://back-end-wwe.herokuapp.com/graphql`
<details>
<summary>Example query (expand)</summary>

  ```
  mutation {
   updateRestaurants(input: {
    params: {
      first: {
        eventId: "1234500", yelpId: "f00d1sLyf311"
      },
      second: {
        eventId: "1234500", yelpId: "Gr2bs00menOMNoms"
      },
      third: {
        eventId: "1234500", yelpId: "suPP0fd2D2y"
      }
    }
  }) {
    restaurant {
    	yelpId
      votes
      name
    }
  }
}
  ```
</details>

<details>
<summary>Example response (expand)</summary>

```json
{
  "data": {
    "updateRestaurants": {
      "restaurant": [
        {
          "yelpId": "f00d1sLyf311",
          "votes": 3,
          "name": "Cuisine All"
        },
        {
          "yelpId": "Gr2bs00menOMNoms",
          "votes": 2,
          "name": "All the Yums"
        },
        {
          "yelpId": "suPP0fd2D2y",
          "votes": 1,
          "name": "Nom Noms for Dayz"
        }
      ]
    }
  }
}
```
</details>

### 4. Fetch Event with Updated Votes Query
`POST https://back-end-wwe.herokuapp.com/graphql`
<details>
<summary>Example query (expand)</summary>

  ```
  {
  fetchEvent(uid: "1234500") {
    uid
    restaurants {
      name
      yelpId
      votes
    }
  }
}
  ```
</details>

<details>
<summary>Example response (expand)</summary>

```json
{
  "data": {
    "fetchEvent": {
      "uid": "1234500",
      "restaurants": [
        {
          "name": "Cuisine All",
          "yelpId": "f00d1sLyf311",
          "votes": 3
        },
        {
          "name": "All the Yums",
          "yelpId": "Gr2bs00menOMNoms",
          "votes": 2
        },
        {
          "name": "Nom Noms for Dayz",
          "yelpId": "suPP0fd2D2y",
          "votes": 1
        }
      ]
    }
  }
}
```
</details>

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
