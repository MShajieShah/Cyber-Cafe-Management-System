puts "-------------------------------------"
puts "|                                   |"
puts "|   Cyber Cafe Management System    |"
puts "|                                   |"
puts "-------------------------------------"

puts "Enter a valid Password"
pass = gets.chomp
if pass[/^(?=.*[a-zA-Z])(?=.*[0-9])/] == nil
  puts "Invalid Password.\n"
  puts "A password must have at characters.\n" +
         "A password consists of also digits.\n"
else
  system("clear")
  puts "Welcome to Cyber Cafe Management System"
  puts
  puts
  puts "1. Master Entry"
  puts "2. Cafe Management"
  puts "3. Exit"
  choice = gets.chomp
  if choice == "1"
    system("clear")
    puts "        Main Master Menu"
    puts ""
    puts "         1.Member Entry"
    puts "         2.Computer Entry"
    option = gets.chomp
    if option == "1"
      # file = File.new("member-data/Memberdata.rb", 'w+')
      # file.puts ("")
      system("clear")
      puts "         Member Menu  "
      puts "     1.Add Member"
      puts "     2.Show Member"
      puts "     3.Update Member Record"
      puts "     4.Delete Member Record"
      puts "     5.Search Member Record"
      pick = gets.chomp
      if pick == "1"
        ifile = File.open("data/memberdata")
        data = ifile.readlines
        ifile.close
        puts "Enter Name:"
        name = gets.chomp
        puts "Enter Address: "
        address = gets.chomp
        data.insert(1, "Name :", name, "  ", "Address:", address, "\n")
        File.write("data/memberdata", data.join, mode: "w")
      elsif pick == "2"
        File.foreach("data/memberdata") { |line| puts line }
      elsif pick == "3"
        puts " Wil be update soon"
      elsif pick == "4"
        puts "Name"
        name = gets.chomp
        read_file = File.new("data/memberdata", "r+").read
        write_file = File.new("data/memberdata", "w")
        puts "Record Deleted Sucessfully"
        read_file.each_line do |line|
          write_file.write(line) unless line.include? name
        end
      elsif pick == "5"
        puts "will be searching soon"
      else
        puts "HALT...!!! You Choose Wrong option "
      end
    elsif option == "2"
      puts "Computer Entry"
    else
      system("clear")
      puts "HALT....!!!! You choose the wrong Option"
      puts "Restart again"
    end
  elsif choice == "2"
    puts "Welcome to th Mangement Page"
  else
    puts "Log Out"
  end
end
