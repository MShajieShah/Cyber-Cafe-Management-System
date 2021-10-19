class Computer
  attr_accessor :name, :gene

  def initialize(name, gene)
    @name = name
    @gene = gene
  end

  def save_member()
    ifile = File.open("data/computerdata")
    data = ifile.readlines
    ifile.close
    data.insert(1, "Name :", comp_name, "  ", "Generation:", comp_gene, "\n")
    File.write("data/computerdata", data.join, mode: "w")
  end

  def self.show_member()
    File.foreach("data/computerdata") { |line| puts line }
  end

  def update_member(prev_name)
    ifile = File.open("data/computerdata")
    data = ifile.readlines
    data.insert(2, "Name :", update_comp_name, "  ", "Generation", update_comp_gene, "\n")
    File.write("data/computerdata", data.join, mode: "w")
    read_file = File.new("data/computerdata", "r+").read
    write_file = File.new("data/computerdata", "w")
    puts "Record Updated Sucessfully"
    read_file.each_line do |line|
      write_file.write(line) unless line.include? prev_name
    end
  end

  def self.delete_member(del_name)
    read_file = File.new("data/computerdata", "r+").read
    write_file = File.new("data/computerdata", "w")
    puts "Record Deleted Sucessfully"
    read_file.each_line do |line|
      write_file.write(line) unless line.include? del_name
    end
  end

  def self.search_member(search_name)
    comp_list = File.readlines("data/computerdata").select { |word| word.include?(search_name) }
    puts comp_list
  end
end
