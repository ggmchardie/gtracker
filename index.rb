## Gtracker terminal app

#welcome
puts "Hi There! Welcome to Gtracker :)"

#name input
puts "Firstly, what's your name?"
name = gets.chomp

puts "Welcome " + name


#view question
puts "Would you like to view or set your goals?"


#view
case  (gets.chomp)
when "view"
    puts "Goals:"

#set
when "set" 
    puts "Please enter your three goals"

#neither
else
    puts "please type either view or set"
end