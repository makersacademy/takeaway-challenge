class Order
require_relative 'menu'

# class responsible for taking and holding order from user
# selects items from menu to order
# removes unwanted items from basket

attr_reader :basket

  def initialize
    @basket = []
  end

  def add_item(item)
    basket << item
  end

private

attr_writer :basket

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

def load_order(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
      @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
=end
