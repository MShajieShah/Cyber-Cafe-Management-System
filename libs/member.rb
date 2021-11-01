class Member
  attr_accessor :name, :address, :phno, :email, :role

  def initialize(name, address, phno, email, role)
    @name = name
    @address = address
    @phno = phno
    @email = email
    @role = role
  end

  def save_member
    ifile = File.open("data/memberdata")
    data = ifile.readlines
    ifile.close
    data.insert(1, "Name :", @name, "  ", "Address:", @address, " ", "Phone No:", @phno, " ", "Email:", @email, " ", "role:", @role, " ", "subscription_date: ", (Time.now).strftime("%d"), "\n")
    File.write("data/memberdata", data.join, mode: "w")
    puts "Record Added Sucessfully"
  end

  def self.show_member
    File.foreach("data/memberdata") { |line| puts line }
  end

  def update_member(prev_name)
    ifile = File.open("data/memberdata")
    data = ifile.readlines
    data.insert(1, "Name :", @name, "  ", "Address:", @address, " ", "Phone No:", @phno, " ", "Email:", @email, " ", "role:", @role, " ", "subscription_date: ", (Time.now).strftime("%d"), "\n")
    File.write("data/memberdata", data.join, mode: "w")
    read_file = File.new("data/memberdata", "r+").read
    write_file = File.new("data/memberdata", "w")
    puts "Record Updated Sucessfully"
    read_file.each_line do |line|
      write_file.write(line) unless line.include? prev_name
    end
    write_file.close
  end

  def self.delete_member(del_name)
    read_file = File.new("data/memberdata", "r+").read
    write_file = File.new("data/memberdata", "w")
    puts "Record Deleted Sucessfully"
    read_file.each_line do |line|
      write_file.write(line) unless line.include? del_name
    end
    # read_file.close
    write_file.close
  end

  def self.search_member(search_name)
    mem_list = File.readlines("data/memberdata").select { |word| word.include?(search_name) }
    puts mem_list
  end
end
