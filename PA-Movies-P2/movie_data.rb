require_relative 'thing'

class Movie_Data
  #two Hashes one holding movies and one holding users
  attr_accessor :movies, :users

  #initialize hashes
  def initialize()
    @movies = Hash.new
	@users = Hash.new
  end

  #read data, split the string, and puts each instance in movies and users as thing objects
  def load_data(filename)
    data = open ("ml-100k/#{filename}")
	while (line = data.gets) do
	  line2 = line.split("	")
	  inside = false
	  if @movie != nil
		for entry in @movies.keys do
		  if line2[1].eql? @movies[entry].id
		    inside = true
		    @movie[entry].add_entry(line2[0],line2[2])
		  end
		end
	  end
	  if inside == false
	    @movies[line2[1]] = Thing.new(line2[1])
		@movies[line2[1]].add_entry(line2[0],line2[2])
	  end
	  
	  inside2 = false
	  if @users != nil
		for entry2 in @users.keys do
		  if line2[0].eql? @users[entry2].id
		    inside2 = true
		    @users[entry2].add_entry(line2[1],line2[2])
		  end
		end
	  end
	  if inside2 == false
	    @users[line2[0]] = Thing.new(line2[1])
		@users[line2[0]].add_entry(line2[1],line2[2])
	  end
	  
	  
	end
  end

  #gets the arrays generated via calc and picks one of the highest elements in the array to return
  def predict(user,movie)
    rater = @users[user]
	ratee = @movies[movie] 
	#nil cases
	if rater == nil and ratee == nil
	  return rand(5) + 1
	elsif rater == nil
	  ratings = ratee.calc
	  return choose_index_of_max(ratings)
	elsif ratee == nil
	  ratings = rater.calc
	  return choose_index_of_max(ratings)
	else
	#non-nil case
      r1 = rater.calc
	  r2 = ratee.calc
	  sum_rating = Array.new
	  for i in 0..4
	    sum_rating[i] = r1[i] + r2[i]
	  end
	  return choose_index_of_max(sum_rating)
	end
  end
  
  #choosing one of the highest elements in the array
  def choose_index_of_max(array)
    all = Array.new
	max_val = array.max
	for i in 0..4
      if array[i] == max_val
	    all.push(i + 1)
	  end
    end
	return all[rand(all.length)]
  end























end



