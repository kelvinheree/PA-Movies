require_relative 'validator'

print "Base File: "
base = gets.chomp
print "Test File: "
test = gets.chomp
print "Output File: "
name = gets.chomp
puts Time.now
v = Validator.new(base,test,name)
v.validate()
puts Time.now



