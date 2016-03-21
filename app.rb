# Pre-configurations (Change if you want an awesome difficulty assessment)
require_relative 'config/application'


#ARGV-no interaction with user after program has started
#Have to obtain all input from user prior to running/executing the program

# Your Code begins from this line onwards #
input = ARGV

command = input[0]
input.shift #remove command from input array

if command == "--list"
  Contact.list

elsif command == "--add"
  address = input[-1].split(",") 
  Contact.add_contact(name: input[0], phone: input[1], house_number: address[0], street: address[1], zipcode: address[2], state: address[3])

elsif command =="--update"
  address = input[-1].split(",")
  id = input [0]
  if Contact.exists?(input.join.to_i)
    Contact.update_contact(id, name: input[1], phone: input[2], house_number: address[0], street: address[1], zipcode: address[2], state: address[3])
  else
    puts "Hey, Something went wrong! I can't find that USER! Are you sure that is the right ID?"
  end

elsif command == "--delete"
  if Contact.exists?(input.join.to_i)
    Contact.delete_contact(input.join.to_i)
  else
    puts "Hey, Something went wrong! I can't find that USER! Are you sure that is the right ID?"
  end
else
  puts "Sorry, that is an invalid command!"
end
