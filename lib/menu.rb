class Menu
# class responsible for showing menu
# require './menu.csv'

attr_reader :menu

  def initialize
    @menu = []
  end

  def open
    load_menu
    menu.each_with_index do |menu, index|
      puts "#{index + 1}. #{menu[:item]}, £#{menu[:price]}"
    end
  end

  def load_menu(filename = "./lib/menu.csv")
    file = File.open(filename, "r")
    file.readlines.each do |line|
      item, price = line.chomp.split(',')
      @menu << {item: item, price: price}
    end
    file.close
  end


end

=begin
def save_students
  # pen the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    #hobby country height
    student_data = [student[:name], student[:cohort]]#, student[:hobby], student[:country], student[:height]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
      @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end
=end
