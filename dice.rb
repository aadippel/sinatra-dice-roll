require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:elephant, { :layout => :wrapper })
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end

get("/dice/2/6") do
  @rolls = []    # Create a blank array

  2.times do    # 2 times...
    die = rand(1..6)    # Generate a random number

    @rolls.push(die)    # Add the random number to the array 
  end

  <% if @die == 1 %>
  <p style="color: red"><%= @outcome %></p>
<% elsif @die == 20 %>
  <p style="color: green"><%= @outcome %></p>
<% else %>
  <p><%= @outcome %></p>

  @outcome = "You rolled a #{@die}."

  erb(:two_six)
end

get("/dice/2/10") do
  @rolls = []    # Create a blank array

  2.times do    # 2 times...
    die = rand(1..10)    # Generate a random number

    @rolls.push(die)    # Add the random number to the array 
  end

  @outcome = "You rolled a #{@die}."

  erb(:two_ten)
end

get("/dice/1/20") do
  @rolls = []    # Create a blank array

  1.times do    # 1 time...
    die = rand(1..20)    # Generate a random number

    @rolls.push(die)    # Add the random number to the array 
  end

  @outcome = "You rolled a #{@die}."

  erb(:one_twenty)
end

get("/dice/5/4") do
  @rolls = []    # Create a blank array

  5.times do    # 5 times...
    die = rand(1..4)    # Generate a random number

    @rolls.push(die)    # Add the random number to the array 
  end

  @outcome = "You rolled a #{@die}."

  erb(:five_four)
end

get("/dice/100/6") do
  @rolls = []    # Create a blank array

  100.times do    # 100 times...
    die = rand(1..6)    # Generate a random number

    @rolls.push(die)    # Add the random number to the array 
  end

  @outcome = "You rolled a #{@die}."
  
  erb(:one_hundred_six)
end
