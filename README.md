✈️Flight Booker- Small coding task 

A ruby on rails project where users can search for flights, sect one, enter passenger details, and confirm a booking.


This project shows use of the following;
-Rails models with associations 
-Nested forms for related records 
-Querying seed data
-Passing parameters between pages 

Setup 
  Install dependencies (bundle install),
  Setup database (rails db:create db:migrate db:seed),
  Run the server (rails server),
  Visit in browser (http://localhost:3000/flights).

Key Files 
  Models 
    flights.rb - manage flights data 
    booking.rb - links flights and passengers 
    passenger.rb  store passenger details 

  Views 
    flights/index.html.erb - flight search and result 
    bookings/new.html.erb - booking form with passengers 
    bookings/show.html.erb - confirmation page 

  Stylesheets 
    flights.css - styling for search and results 
    booking.css - styling for booking form and confirmation 

Database Schema 
  Airports - id, code 
  Flights - id, departure_airport, arrival_airport, date, duration 
  Bookings - id, flight_id 
  Passengers - id, booking_id, name, email 

18/08/2025
created new rails app 
installed gems and configured database

19/08/2025
Created all pages,
Generated airport,flight,booking, and passenger models
set up associations 
added data for airport and flights 
tested flights 

20/08/2025
Created search form with dropdowns for departure, arrival, date, passengers. 
Displayed matching flights in results section. 
Added "Select Flight" button.
Button did not pass test. Wasnt connecting to the database to bring up chosen flights.
Worked on correcting the button

21/08/2025 
Button is now working 
Created form to collect passenger name/email, 
Implemented accepts_nested_attributed_for :passengers 
Tested passenger records to ensure they save to databse. 
Displayed flight details and passenger list after saving, 
Added link to return to flight search. 

22/08/25
Created flight.css for search and results page 
Added booking.css for booking form and confirmation
Improved layout with headers, spacing and buttons 
Completed write up 




