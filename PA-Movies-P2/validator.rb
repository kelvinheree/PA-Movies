require_relative 'movie_data'

class Validator

  attr_accessor :set_a, :set_b

  def initialize(base,test)
    @set_a = Movie_Data.new
	@set_a.load_data(base)
	@set_b = open ("ml-100k/#{test}")
  end

  #run through the second file and does comparison tests with the rating and predictions
  def validate()
    correct = 0
	incorrect = 0
	close = 0
    while (line = @set_b.gets) do
	  line2 = line.split("	")
	  if (@set_a != nil)
	    rating = @set_a.predict(line2[0],line2[1])
	    difference = (rating - line2[2].to_i).abs
	    if difference == 0
	      correct += 1
	    elsif difference <= 1
		  close += 1
		else
	      incorrect += 1
	    end
	  end
	end
	puts "Correct guesses = #{correct}"
	puts "Close guesses (within range of 1) = #{close}"
	puts "Incorrect guesses = #{incorrect}"

  end
  
end



