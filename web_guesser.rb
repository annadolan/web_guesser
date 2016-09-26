require 'sinatra'
require 'sinatra/reloader'


NUMBER = rand(100)

get '/' do
guess = params['guess'].to_i
color, message = check_guess(guess)
erb :index, :locals => {:number => NUMBER, :message => message, :color => color}
end

def check_guess(guess)
  if guess == 0 && NUMBER != 0
    ["#ffffff", "Guess a number!"]
  elsif guess > NUMBER && guess <= (NUMBER + 5)
    ["#ffe6e6", "Too high!"]
  elsif guess > (NUMBER + 5)
    ["#ff1a1a", "Way too high!"]
  elsif guess < NUMBER && guess >= (NUMBER - 5)
    ["#ffe6e6", "Too low!"]
  elsif guess  < (NUMBER - 5)
    ["#ff1a1a", "Way too low!"]
  elsif guess == NUMBER
    ["#00ff00", "You got it right! The SECRET NUMBER is #{NUMBER}"]
  end
end
