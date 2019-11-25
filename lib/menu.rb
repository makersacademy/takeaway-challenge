require 'CSV'

class Menu

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def view(file = "./lib/dishes.csv")
    load_dishes(file)
    print_menu
  end

  def select_item(id)
    @dishes[id - 1]
  end

  private

  def load_dishes(file)
    CSV.foreach(file, { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all }).with_index(1) do |row, i|
      @dishes << row.to_h
      @dishes[i - 1][:id] = i
    end
  end

  def print_menu
    @dishes.each_with_index { |v, i| puts "#{i + 1}.  #{v[:dish]}    #{v[:unit_price]}" }
  end
end
