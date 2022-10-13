# README

## Admin APIs
The Admin APIs will be used to manage the company's inventory of Frames and Lenses.
### Requirements:
- As an admin I want to be able to create frames that have:
  - Name : string
  - Description: text
  - Status: (Active, inactive)
  - Stock: integer
○ Price: float
- I also want to be able to create lenses that have:
  - Colour: string
  - Description: text
  - Prescription_type: (fashion, single_vision, varifocals)
  - Lens_type: (classic, blue_light, transition)
  - Stock: integer
  - Price: float
- Prices need to be unique per currency, for this exercise we want to support the following
currencies:
  - USD
  - GBP
  - EUR
  - JOD
  - JPY

## User APIs.

The User APIs will give the user the ability to create glasses by picking one frame and one lens
and then seeing a total price.
### Requirements:
- As a user, I can see only active frames.
- As a user I can view all lenses.
- As a user I can create custom glasses by matching one frame with one lens and storing
it in the shopping basket:
  - Price shown needs to be based on the user's currency.
  - If the user tries to create glasses while a frame or a lens is out of stock (stock =
0) the user will get an error saying that the frame or lens is out of stock.
- Whenever a user successfully creates glasses, stock of the frame and the lens is
subtracted by 1.

## Setup
- Clone the repo
- Run `bundle install`
- Run `rails db:create db:migrate db:seed`
- Run `rails s`
- Run `rspec` to run the tests

## API Documentation
 You can find the API documentation [here](https://documenter.getpostman.com/view/16059767/2s83znqMsc)

## Notes
- No tests where written at this time due to my bundled up schedule, this project was done in 7 - 8 hours.
