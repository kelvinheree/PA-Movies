class Thing
  attr_accessor :id, :rating_dic
  
  def initialize(num)
    @id = num
	@rating_dic = Hash.new
  end

  def add_entry(char,rating)
    rating_dic[char] = rating
  end
  
  #makes an array to return where each index has the # of occurences for the rating e.g. index 0 has the # of occurences of 1
  def calc()
    ratings = [0,0,0,0,0]
    @rating_dic.each do |key, value|
	  ratings[value.to_i - 1] += 1
	end
    return ratings
  end
	
	
	
end