require_relative "libs/member.rb"
require_relative "libs/computer.rb"
require_relative "libs/charges.rb"

def member_input
  puts "Enter Name: "
  name = (gets.chomp).downcase
  if name[/\s/] != nil
    puts "Name not having a space"
    name = (gets.chomp).downcase
  end
  puts "Enter Address: "
  address = gets.chomp
  puts "Enter Phone Number"
  phno = gets.chomp
  if phno[/^([+])?([^\d]?\d){5,18}$/] == nil
    puts "Invalid"
    puts "Enter Again Phone Number"
    phno = gets.chomp
    if phno[/^([+])?([^\d]?\d){5,18}$/] == nil
      puts "Again wrong input."
      puts "System is about to exit"
      exit
    end
  end
  puts "Enter Email Address: "
  email = gets.chomp
  if email[/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i] == nil
    puts "Invalid Email"
    puts "Enter Again Email Address: "
    email = gets.chomp
    if email[/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i] == nil
      puts "Again wrong input."
      puts "System is about to exit"
      exit
    end
  end
  puts "Enter User Role"
  role = gets.chomp
  return name, address, phno, email, role
end

def computer_input
  puts "Enter Name: "
  name = (gets.chomp).downcase
  puts "Enter Generation: "
  gene = gets.chomp
  return name, gene
end

puts "-------------------------------------"
puts "|                                   |"
puts "|   Cyber Cafe Management System    |"
puts "|                                   |"
puts "-------------------------------------"
puts "Enter User Name"
entry_name = (gets.chomp).downcase

puts "Enter a valid Password"
pass = gets.chomp
if pass[/^(?=.*[a-zA-Z])(?=.*[0-9])/] == nil
  puts "Invalid Password.\n"
  puts "A password must have at characters.\n" +
         "A password consists of also digits.\n"
else
  f = File.readlines("data/memberdata").select { |word| word.include?(entry_name) }
  if f == []
    puts "NO Result Found..!!!"
  else
    admin_exist = (f.map { |x| x.include? "admin" })
    current_date = (Time.now).strftime("%d")
    user_date = f[0][-3] + f[0][-2]
    sum = current_date.to_i - user_date.to_i
    main_menu_flag = true
    while main_menu_flag
      if (admin_exist.to_s).include?("true")
        system("clear")
        if sum > 0
          puts "Its time to renew subscription"
        end
        puts "Welcome to Cyber Cafe Management System"
        puts
        puts
        puts "1. Master Entry"
        puts "2. Cafe Management"
        puts "3. Exit"
        choice = gets.chomp
      else
        system("clear")
        if sum > 0
          puts "Its time to renew subscription"
        end
        puts "Welcome to Cyber Cafe Management System"
        puts
        puts
        puts "1.             "
        puts "2. Cafe Management"
        puts "3. Exit"
        choice = gets.chomp
      end
      if choice == "1"
        if (admin_exist.to_s).include?("true")
          system("clear")
          puts "        Main Master Menu"
          puts ""
          puts "         1.Member Entry"
          puts "         2.Computer Entry"
          option = gets.chomp
          if option == "1"
            member_menu_flag = true
            while member_menu_flag
              system("clear")
              puts "         Member Menu  "
              puts "     1.Add Member"
              puts "     2.Show Member"
              puts "     3.Update Member Record"
              puts "     4.Delete Member Record"
              puts "     5.Search Member Record"
              puts "     6.Return"
              pick = gets.chomp
              if pick == "1"
                members = member_input
                mem = Member.new(members[0], members[1], members[2], members[3], members[4])
                mem.save_member
                puts "Enter any key to continue"
                inp = gets.chomp
              elsif pick == "2"
                Member.show_member
                puts "Enter any key to continue"
                inp = gets.chomp
              elsif pick == "3"
                puts "Enter name you want to change record"
                prev_name = (gets.chomp).downcase
                members = member_input
                up = Member.new(members[0], members[1], members[2], members[3], members[4])
                up.update_member(prev_name)
                puts "Enter any key to continue"
                inp = gets.chomp
              elsif pick == "4"
                puts "Name"
                del_name = (gets.chomp).downcase
                Member.delete_member(del_name)
                puts "Enter any key to continue"
                inp = gets.chomp
              elsif pick == "5"
                puts "Name"
                search_name = gets.chomp
                Member.search_member(search_name)
                puts "Enter any key to continue"
                inp = gets.chomp
              elsif pick == "6"
                member_menu_flag = false
              else
                puts "HALT...!!! You Choose Wrong option "
              end
            end
          elsif option == "2"
            computer_flag = true
            while computer_flag
              system("clear")
              puts "         Computer Entry Menu  "
              puts "     1.Add Computer"
              puts "     2.Show Computer"
              puts "     3.Update Record"
              puts "     4.Delete Record"
              puts "     5.Search Record"
              puts "     6.Return"
              pick = gets.chomp
              if pick == "1"
                compters = computer_input
                comp = Computer.new(compters[0], compters[1])
                comp.save_member
              elsif pick == "2"
                Computer.show_member
              elsif pick == "3"
                puts "Enter name you want to change record"
                prev_name = gets.chomp
                computers = computer_input
                update_comp = Computer.new(computers[0], computers[1])
                update_comp.update_member(prev_name)
                puts "Enter any key to continue"
                inp = gets.chomp
              elsif pick == "4"
                puts "Enter Computer Delete Record"
                del_name = gets.chomp
                Computer.delete_member(del_name)
                puts "Enter any key to continue"
                inp = gets.chomp
              elsif pick == "5"
                puts "Enter Computer Search Name"
                search_name = gets.chomp
                Computer.search_member(search_name)
                puts "Enter any key to continue"
                inp = gets.chomp
              elsif pick == "6"
                computer_flag = false
              else
                puts "HALT...!!! You Choose Wrong option "
              end
            end
          else
            system("clear")
            puts "HALT....!!!! You choose the wrong Option"
            puts "Restart again"
          end
        else
          puts "You are not Admin"
        end
      elsif choice == "2"
        start_time = 0
        end_time = 0
        cafe_flag = true
        result = "Charges Nill"
        while cafe_flag
          system("clear")
          p result
          puts "Welcome to Cyber Cafe Managment System "
          puts "1.Booking"
          puts "2.Charges"
          puts "3.Renewal"
          puts "4.Return"
          pick = gets.chomp

          if pick == "1"
            system("clear")
            puts "1.Member Log In"
            puts "2.Member Log Out"
            puts "3.Return"
            member_flag = true
            while member_flag
              inp_entry = gets.chomp
              if inp_entry == "1"
                start_time = (Time.now).strftime("%M")
                puts "50 rupees for ten minutes after that every minutes charge 5 rupee per minute"
              elsif inp_entry == "2"
                end_time = (Time.now).strftime("%M")
                p "Logged Out"
              elsif inp_entry == "3"
                member_flag = false
              else
                system("clear")
                puts "HALT....!!!! You choose the wrong Option"
                puts "Restart again"
              end
            end
          elsif pick == "2"
            result = Charge.fare_calculator(end_time, start_time)
          elsif pick == "3"
            system("clear")
            puts "Your renewal request is forward"
            puts "Now contact your Admin"
            puts "Enter any key to continue"
            inp = gets.chomp
          elsif pick == "4"
            cafe_flag = false
          else
            system("clear")
            puts "HALT....!!!! You choose the wrong Option"
            puts "Restart again"
          end
        end
      else
        puts "Log Out"
        main_menu_flag = false
      end
    end
  end
end
