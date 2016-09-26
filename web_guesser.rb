require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(100)

def check_guess(guess)
  if guess == 0 && NUMBER != 0
    @color = "#ffffff"
    "Guess a number!"
  elsif guess > NUMBER && guess <= (NUMBER + 5)
    @color = "#ffe6e6"
    "Too high!"
  elsif guess > (NUMBER + 5)
    @color = "#ff1a1a"
    "Way too high!"
  elsif guess < NUMBER && guess >= (NUMBER - 5)
    @color = "#ffe6e6"
    "Too low!"
  elsif guess  < (NUMBER - 5)
    @color = "#ff1a1a"
    "Way too low!"
  elsif guess == NUMBER
    @color = "#00ff00"
    "You got it right! The SECRET NUMBER is #{NUMBER}"
  end
end

get '/' do
guess = params['guess'].to_i
message = check_guess(guess)
erb :index, :locals => {:number => NUMBER, :message => message, :color => @color}

end
