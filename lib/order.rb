class Order

# class responsible for adding and
# removing items from basket

attr_reader :basket

  def initialize
    @basket = []
    @total
  end

  def add_item(item)
    basket << item
  end

  def show_basket
    self.basket = basket.sort_by{ |basket| basket[:price] }
    basket.each_with_index do |basket, index|
      puts "#{index + 1}. #{basket[:item]}, £#{basket[:price]}"
    end
  end

  def delete_item(item_number)
    item = basket[item_number-1]
    self.basket.delete(item)
  end

  def total
    self.total = basket.map { |basket| basket[:price].to_i }.reduce(:+)
  end

  def summary
    "You have #{basket.count} items totalling £#{total} in your basket."
  end

private

attr_writer :basket, :total



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
