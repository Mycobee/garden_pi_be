# GARDEN PI - BACK END

GardenPi is an app you can use to monitor and water your plants from anywhere. It uses a Raspberry Pi It was created by Billy Urrutia, Brian Plantico, Colby Allen, David Engel, and Rob Stringer while Module 4 students at the Turing School of Software and Design in Denver, Colorado.

GitHub Repository for the Back End: https://github.com/Mycobee/garden_pi_be    
GitHub Repository for the Front End: https://github.com/Mycobee/garden_pi_fe    
GitHub Repository for the Raspberry Pi: https://github.com/Mycobee/garden_python   

+ Billy Urrutia: https://github.com/CosmicSpagetti
+ Brian Plantico: https://github.com/bplantico
+ Colby Allen: https://github.com/colbyallen012
+ David Engel: https://github.com/David5280
+ Rob Stringer: https://github.com/Mycobee

### About
GardenPi is built using several popular technologies, and divides responsibilities between the front end interface and back end functionality. The back end was written in Ruby (version 2.6.3) and uses the Ruby on Rails framework (version 5.2.3) along with a PostgreSQL database (version 11.5). TravisCI was used as a continuous integration tool throughout the project, along with Git/GitHub for version control and code review by team members. The Raspberry Pi utilizes scripts written in Python3 along with cron jobs used to automate sending requests to the API endpoints made available by the Rails app. Additionally, the codebase for the back end application is deployed to Heroku at both
https://garden-pi-be.herokuapp.com and
https://garden-pi-backend.herokuapp.com

### Setup & Configuration

It's not necessary to install and run the program on your local machine, as it is deployed to Heroku and the endpoints outlined below can be accessed without running the application locally, however, if you're interested in working on the code base the following instructions will help you get started:

1. Fork and/or clone this repository to your local machine.

1. cd into the garden_pi_be directory and run `bundle install` from your command line.

1. To set up the database, run `bundle exec rake db:create` and `bundle exec rake db:migrate`

1. You're ready to go! Please reach out if you have any other questions or concerns.

### Schema
![GardenPi Schema](https://user-images.githubusercontent.com/43261385/65453131-17c49100-de32-11e9-8a4a-dbe0b517b07a.png)

### Learning Goals
The following learning goals were achieved by our team during this project:
+ Use an agile process to turn well defined requirements into deployed and production ready software.
+ Gain experience dividing applications into components and domains of responsibilities to facilitate multi-developer teams. Service oriented. architecture concepts and patterns were highly encouraged.
+ Explore and implement new concepts, patterns, or libraries that had not been explicitly taught while at Turing.
+ Practice an advanced, professional git workflow.
+ Gain more experience using continuous integration tools to build and automate the deployment of features in various environments.
+ Build applications that execute in development, test, CI, and production environments.
+ Focus on communication between front-end and back-end teams in order to complete and deploy features that had been outlined by the project spec.
+ Ultimately, demonstrate knowledge we gained throughout Turing.

### Request Endpoints
+ [Gardens](#gardens)
+ [Environment Measurements](#env_measurements)
+ [Jobs](#jobs)
+ [Daily Average Moisture](#daily_avg_moisture)
+ [Users](#users)

### <a name="gardens"></a>Gardens Request
`https://garden-pi-be.herokuapp.com/api/v1/gardens/:id`

HTTP verbs accepted: `GET`

The gardens show endpoint receives a GET request along with a Garden ID as part of the URL path. If the garden with the ID provided exists, then its name, latitude, and longitude will be returned. If the garden with the ID doesn't exist, a 404 status will be returned along with the message "Garden Not Found."

An example of a successful request:
```
GET https://garden-pi-be.herokuapp.com/api/v1/gardens/1
Content-Type: application/json
Accept: application/json
```
Successful response:
```
status: 200 OK
body:

{
  "data":
  {
    "id": "1",
    "type": "garden",
    "attributes":
    {
      "id": 1,
      "name": "Backyard Raised Bed",
      "latitude": 42.3601,
      "longitude": -71.0589
    }
  }
}
```

### <a name="env_measurements"></a>Environment Measurements Request
`https://garden-pi-be.herokuapp.com/api/v1/gardens/:id/env_measurements`

HTTP verbs accepted: `GET`, `POST`

The Environment Measurements endpoint can receive either:
1) a GET request without parameters in which case a JSON formatted object which contains the environment measurements associated with the given garden is returned or
B) a POST request along with parameters of `soil_temperature` and `soil_moisture` in which case the newly created object is returned.

If a garden does not exist for the ID provided, then a 404 error with the object {"error": "Garden Not Found"} is returned.

An example of a successful GET request:
```
GET https://garden-pi-be.herokuapp.com/api/v1/gardens/1/env_measurements
Content-Type: application/json
Accept: application/json
```

An example of a successful response to a GET request:
```
status: 200 OK
body:

{
  "data":
  [
    {
      "id": "1",
      "type": "env_measurement",
      "attributes":
      {
        "soil_temperature": 79.0,
        "soil_moisture": 15.0,
        "created_at": "2019-09-09T21:17:28.396Z"
      }
    },
    {
      "id": "2",
      "type": "env_measurement",
      "attributes":
      {
        "soil_temperature": 72.0,
        "soil_moisture": 32.0,
        "created_at": "2019-09-09T21:02:28.424Z"
      }
    },
    {
      "id": "3",
      "type": "env_measurement",
      "attributes":
      {
        "soil_temperature": 62.0,
        "soil_moisture": 10.0,
        "created_at": "2019-09-09T20:47:28.431Z"
      }
    },
    {
      "id": "4",
      "type": "env_measurement",
      "attributes":
      {
        "soil_temperature": 79.0,
        "soil_moisture": 5.0,
        "created_at": "2019-09-09T20:32:28.438Z"
      }
    },
    {
      "id": "5",
      "type": "env_measurement",
      "attributes":
      {
        "soil_temperature": 87.0,
        "soil_moisture": 65.0,
        "created_at": "2019-09-09T20:17:28.444Z"
      }
    }
  ]
}
```
An example of a successful POST request:
```
POST https://garden-pi-be.herokuapp.com/api/v1/gardens/1/env_measurements?soil_moisture=19.99&soil_temperature=69.25
Content-Type: application/json
Accept: application/json
```
An example of a successful response to a POST request:
```
status: 201 CREATED
body:
{
  "data":
  {
    "id": "3",
    "type": "env_measurement",
    "attributes":
    {
      "soil_temperature": 69.25,
      "soil_moisture": 19.99,
      "created_at": "2019-09-12T05:56:11.575Z"
    }
  }
}
```
### <a name="jobs"></a>Jobs Request
`https://garden-pi-be.herokuapp.com/api/v1/gardens/:id/jobs`

HTTP verbs accepted: `GET`, `POST`

The jobs endpoint receives a Garden ID in the URL path along with either:
1) a GET request without a parameter,
2) a GET request with a parameter of `seconds_ago` or,
3) a POST request with a parameter of 'name'.

If a garden ID is provided for a garden that doesn't exist, then a 404 error with the message of "Garden Not Found" is returned.

An example of a successful GET request without a parameter:
```
GET https://garden-pi-be.herokuapp.com/api/v1/gardens/1/jobs
Content-Type: application/json
Accept: application/json
```
An example of a successful response to a GET request:
```
{
  "data":
  [
    {
      "id": "1",
      "type": "job",
      "attributes":
      {
        "id": 1,
        "name": "water",
        "created_at": "2019-09-09T19:32:55.805Z"
      }
    },
    {
      "id": "2",
      "type": "job",
      "attributes":
      {
        "id": 2,
        "name": "water",
        "created_at": "2019-09-09T19:47:55.826Z"
      }
    },
    {
      "id": "3",
      "type": "job",
      "attributes":
      {
        "id": 3,
        "name": "water",
        "created_at": "2019-09-09T20:02:55.832Z"
      }
    },
    {
      "id": "4",
      "type": "job",
      "attributes":
      {
        "id": 4,
        "name": "water",
        "created_at": "2019-09-09T20:17:55.839Z"
      }
    },
    {
      "id": "5",
      "type": "job",
      "attributes":
      {
        "id": 5,
        "name": "water",
        "created_at": "2019-09-09T20:32:55.848Z"
      }
    }
  ]
}
```
An example of a successful GET response with a `seconds_ago` parameter (if no jobs have been created in the last 10 seconds):
```
{
    "data": []
}
```
An example of a successful GET response with a `seconds_ago` parameter (if one job has been created in the last 10 seconds):
```
{
  "data":
  [
    {
      "id": "242",
      "type": "job",
      "attributes":
      {
        "id": 242,
        "name": "water",
        "created_at": "2019-09-12T06:14:30.594Z"
      }
    }
  ]
}
```
### <a name="daily_avg_moisture"></a>Daily Average Moisture Request
`https://garden-pi-be.herokuapp.com/api/v1/gardens/:id/daily_avg_moisture`

HTTP verbs accepted: `GET`

The daily average moisture endpoint receives a GET request along with a parameter of `days`. The `days` parameter represents the number of days to return (today is not included) and the average soil moisture for each day is also returned. For example, if `?days=7` is passed in as the parameter, one week of daily averages, starting yesterday, will be returned.

An example of a successful GET request:
```
GET https://garden-pi-be.herokuapp.com/api/v1/gardens/1/daily_avg_moisture?days=7
Content-Type: application/json
Accept: application/json
```
An example of a successful response to a GET request:
```
status: 200
body:
{
  "data":
  {
    "attributes":
    {
      "2019-09-05 00:00:00 +0000": "45.62",
      "2019-09-06 00:00:00 +0000": "47.89",
      "2019-09-07 00:00:00 +0000": "48.78",
      "2019-09-08 00:00:00 +0000": "49.33",
      "2019-09-09 00:00:00 +0000": "53.68",
      "2019-09-11 00:00:00 +0000": "90.95"
    }
  }
}
```

### <a name="users"></a>Users Request
`https://garden-pi-be.herokuapp.com/api/v1/users`

HTTP verbs accepted: `POST`

The users endpoint receives a POST request along with a body containing a first name, last name, email address, password, and password confirmation. If the email address has not already been used to create a user, and the password matches the password confirmation, then a user is created and a unique API key is returned. If the email address is already in use, the passwords match, and the user can be authenticated, the users api_key will be returned. If the email address is already in use but the password and password confirmation don't match, then an error message telling the user to check that the passwords match will be returned.

An example of a successful POST request:
```
POST https://garden-pi-be.herokuapp.com/api/v1/users
Content-Type: application/json
Accept: application/json

Body (x-www-form-urlenconded form data, form data, or JSON formatted):
{
"first_name": "Johnny"
"last_name": "Appleseed"
"email": "SeedDropper@gardener.com"
"password": "password"
"password_confirmation": "password"
}
```
An example of a successful response to a POST request:
```
status: 201
body:
{
    "api_key": "sqzGq5PWZFqSR4jrjzho-w"
}
```
