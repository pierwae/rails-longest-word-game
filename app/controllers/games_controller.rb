class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << rand(65..90).chr }
  end

  def score
    @letters = params[:letters].upcase.split('')
    @word = params[:word].upcase.split('')

    comparator = @letters.clone
    results = []

    @word.each do |letter|
      results << comparator.include?(letter)
      index = comparator.index(letter)
      comparator.delete_at(index) unless index.nil?
    end

    @score = !results.include?(false)
  end
end
