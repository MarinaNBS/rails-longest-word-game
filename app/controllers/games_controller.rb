require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a
    @letters = Array.new(10) { @letters.sample }
  end

  def score
    # raise
    url = "https://wagon-dictionary.herokuapp.com/#{params[:score]}"
    words = JSON.parse(URI.open(url).read)
    if words["found"] == params[:score]
      @result = "Congradulations! '#{params[:score].capitalize}' is a valid English word"
    elsif params[:score] == params[:letters]
      @result = "Sorry but #{params[:score]} can't be built out of #{params[:letters].split('').join(',').upcase()}."
    else
      @result = "Sorry but #{params[:score]} does not seem to be a valid English word."
    end

    if words["found"] == params[:score]
      @placar = " You won 10 points!"
    else
      @placar = "You've lost 5 points!"
    end
  end
end
