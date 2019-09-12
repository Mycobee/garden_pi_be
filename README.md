# GARDEN PI

GardenPi is an app you can use to monitor and water your plants from anywhere. It was created by Billy Uruttia, Brian Plantico, Colby Allen, David Engel, and Rob Stringer while Module 4 students at the Turing School of Software and Design in Denver, Colorado.

## About
GardenPi is built using several popular technologies, and divides responsibilities between the front end interface and back end functionality. The back end was written in Ruby (version 2.6.3) and uses the Ruby on Rails framework (version 5.2.3) along with a PostgreSQL database (version 11.5). TravisCI was used as a continuous integration tool throughout the project, along with Git/GitHub for version control and code review by team members. Additionally, the codebase for the back end application is deployed to Heroku at both https://garden-pi-be.herokuapp.com and https://garden-pi-backend.herokuapp.com


## Learning Goals
The following learning goals were achieved by our team during this project:
+ Use an agile process to turn well defined requirements into deployed and production ready software.
+ Gain experience dividing applications into components and domains of responsibilities to facilitate multi-developer teams. Service oriented. architecture concepts and patterns were highly encouraged.
+ Explore and implement new concepts, patterns, or libraries that had not been explicitly taught while at Turing.
+ Practice an advanced, professional git workflow.
+ Gain more experience using continuous integration tools to build and automate the deployment of features in various environments.
+ Build applications that execute in development, test, CI, and production environments.
+ Focus on communication between front-end and back-end teams in order to complete and deploy features that had been outlined by the project spec.
+ Ultimately, demonstrate knowledge we gained throughout Turing.

### Configuration

It's not necessary to install and run the program on your local machine, as it is deployed to Heroku and the endpoints outlined below can be accessed without running the application locally, however, if you're interested in working on the code base the following instructions will help you get started:

1. Fork and/or clone this repository to your local machine.

1. cd into the garden_pi_be directory and run `bundle install` from your command line.

1. To set up the database, run `bundle exec rake db:create` and `bundle exec rake db:migrate`

1. You're ready to go! Please reach out if you have any other questions or concerns.

<!-- Request Endpoints
+ [Gardens Show](#gardens_show)
+ [Environment Measurements](#env_measurements)
+ [Jobs](#jobs)
+ [Daily Average Moisture](#daily_avg_moisture)

# <a name="gardens_show"></a>Gardens Show
`https://garden-pi-be.herokuapp.com/api/v1/gardens/:id`

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
    "data": {
        "id": "1",
        "type": "garden",
        "attributes": {
            "id": 1,
            "name": "Backyard Raised Bed",
            "latitude": 42.3601,
            "longitude": -71.0589
        }
    }
}
```

# <a name="login"></a>User Sessions Login
`https://the-express-sweater-weather.herokuapp.com/api/v1/sessions`

The sessions endpoint receives a POST request along with a body containing an `email` address and `password`. If the email address and password credentials are correct for a registered user, then the user's API key is returned.

An example of a successful request:
```
POST https://the-express-sweater-weather.herokuapp.com/api/v1/sessions
Content-Type: application/json
Accept: application/json

{
  "email": "example@email.com",
  "password": "password"
}
```
An example of a successful response:
```
status: 200
body:

{
  "apiKey": "2dcf26f1-71af-4071-9060-24d49b6c86e4",
}
```
# <a name="forecast"></a>Forecast
`https://the-express-sweater-weather.herokuapp.com/api/v1/forecast?location=[example_location]`

The forecast endpoint receives a GET request with a `location` parameter and a body containing an `apiKey` (a valid API key is required), and returns a JSON formatted forecast with keys of `location`, `currently`, `hourly', 'daily`, and `alerts` (if applicable). A total of eight hour objects are returned in `hourly`, and seven day objects are returned in `daily`.

An example of a successful request:
```
GET https://the-express-sweater-weather.herokuapp.com/api/v1/forecast?location=denver,co
Content-Type: application/json
Accept: application/json

body:
{
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```
An example of a successful response:
```
{
    "data": {
        "location": "arvada,co",
        "currently": {
            "time": 1566185614,
            "summary": "Partly Cloudy",
            "icon": "partly-cloudy-night",
            "nearestStormDistance": 77,
            "nearestStormBearing": 83,
            "precipIntensity": 0,
            "precipProbability": 0,
            "temperature": 79.75,
            "apparentTemperature": 79.75,
            "dewPoint": 46.05,
            "humidity": 0.31,
            "pressure": 1011.43,
            "windSpeed": 4.43,
            "windGust": 4.43,
            "windBearing": 319,
            "cloudCover": 0.15,
            "uvIndex": 0,
            "visibility": 10,
            "ozone": 292
        },
        "hourly": [
            {
                "time": 1566183600,
                "summary": "Partly Cloudy",
                "icon": "partly-cloudy-night",
                "precipIntensity": 0,
                "precipProbability": 0,
                "temperature": 81.37,
                "apparentTemperature": 81.37,
                "dewPoint": 45.96,
                "humidity": 0.29,
                "pressure": 1010.9,
                "windSpeed": 4.57,
                "windGust": 4.57,
                "windBearing": 323,
                "cloudCover": 0.15,
                "uvIndex": 0,
                "visibility": 10,
                "ozone": 291.8
            },
            {
                   ... Seven more of the above ...
            }
        ],
        "daily": [
            {
                "time": 1566108000,
                "summary": "Partly cloudy throughout the day.",
                "icon": "partly-cloudy-day",
                "sunriseTime": 1566130601,
                "sunsetTime": 1566179677,
                "moonPhase": 0.61,
                "precipIntensity": 0.0001,
                "precipIntensityMax": 0.0017,
                "precipIntensityMaxTime": 1566194400,
                "precipProbability": 0.07,
                "precipType": "rain",
                "temperatureHigh": 91.27,
                "temperatureHighTime": 1566169200,
                "temperatureLow": 68.63,
                "temperatureLowTime": 1566216000,
                "apparentTemperatureHigh": 91.27,
                "apparentTemperatureHighTime": 1566169200,
                "apparentTemperatureLow": 68.63,
                "apparentTemperatureLowTime": 1566216000,
                "dewPoint": 45.61,
                "humidity": 0.41,
                "pressure": 1010.17,
                "windSpeed": 4.52,
                "windGust": 9.77,
                "windGustTime": 1566126000,
                "windBearing": 19,
                "cloudCover": 0.31,
                "uvIndex": 9,
                "uvIndexTime": 1566154800,
                "visibility": 9.885,
                "ozone": 295.2,
                "temperatureMin": 58.56,
                "temperatureMinTime": 1566133200,
                "temperatureMax": 91.27,
                "temperatureMaxTime": 1566169200,
                "apparentTemperatureMin": 58.56,
                "apparentTemperatureMinTime": 1566133200,
                "apparentTemperatureMax": 91.27,
                "apparentTemperatureMaxTime": 1566169200
            },
            {
                ... Six more of the above ...
            }
        ],
        "alerts": [
            {
                "title": "Air Quality Alert",
                "regions": [
                    "Adams",
                    "Arapahoe",
                    "Boulder",
                    "Broomfield",
                    "Denver",
                    "Douglas",
                    "Jefferson",
                    "Larimer",
                    "Weld"
                ],
                "severity": "advisory",
                "time": 1566166440,
                "expires": 1566252000,
                "description": "Description of any alerts will appear here.",
                "uri": "https://alerts.weather.gov/cap/wwacapget.php?x=CO125D0A8C3D58.AirQualityAlert.125D0A9B7A20CO.BOUAQABOU.1cf776118c3db3569458730525db3fe1"
            }
        ]
    }
}
```
# <a name="favorite_a_location"></a>Favorite a Location
`https://the-express-sweater-weather.herokuapp.com/api/v1/favorites`

The favorite location endpoint receives a POST containing a User's valid `apiKey` and a `location` in the body of the request and saves the location to the User's favorite locations.

An example of a successful request:
```
POST https://the-express-sweater-weather.herokuapp.com/api/v1/favorites
Content-Type: application/json
Accept: application/json

body:

{
  "location": "Denver, CO",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```
An example of a successful response:
```
status: 200
body:

{
  "data": "Denver, CO has been added to your favorites",
}
```
# <a name="list_favorites"></a>List Favorite Locations
Endpoint coming soon.
# <a name="delete_favorite"></a>Delete a Favorite Location
Endpoint coming soon. -->
