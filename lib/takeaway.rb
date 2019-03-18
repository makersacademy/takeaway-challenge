require 'csv'
require 'io/console'

# Takeaway menu class does the brunt of the work
class Takeaway
  attr_accessor :menu

  def initialize(file = "./data/menu.csv")
    @loaded_file = file
    @menu = []
    load_file
  end

  def show(select)
    output = []
    @menu.map { |item| output << item[select] unless output.include? item[select] }
    return output
  end

  def load_file
    CSV.foreach(@loaded_file) do |row|
      number, item, ingredients, category = row
      save_to_menu([number, item, ingredients, category])
    end
    'File loaded!'
  end

  def save_to_menu(line)
    @menu << line
  end
end
