puts "-------------------------------------"
puts "|                                   |"
puts "|   Cyber Cafe Management System    |"
puts "|                                   |"
puts "-------------------------------------"

puts "Enter a valid Password"
pass = gets.chomp
if pass[/^(?=.*[a-zA-Z])(?=.*[0-9])/] == nil
  puts "Invalid Password.\n"
  puts "A password must have at least upper and lower case characters.\n" +
         "A password consists of also digits.\n"
else
  system("clear")
  puts "Welcome to Cyber Cafe"
end
