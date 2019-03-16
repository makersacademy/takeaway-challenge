require 'csv'

# Takeaway menu class does the brunt of the work
class Takeaway
  attr_accessor :menu

  def initialize(file = "./data/testsheet.csv")
    @loaded_file = file
    @menu = []
    load_file
  end

  def show(selection)
    @menu.map { |item| item[selection] }
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
