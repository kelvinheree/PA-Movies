require_relative 'validator'

print "Base File: "
base = gets.chomp
print "Test File: "
test = gets.chomp
v = Validator.new(base,test)
v.validate()

