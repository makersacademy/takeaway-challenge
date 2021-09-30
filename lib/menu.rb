require 'csv'

class Menu
  attr_reader :list

  def initialize
    @list = []
  end

  def display_menu
    load_list
    print_list
  end

  #private

  def load_list
    CSV.foreach("menu.csv", headers: true, header_converters: :symbol) do |row|
      list << row.to_h
    end
  end  

  def print_list
    puts "Today's menu:"
    list.each do |item|
      puts "#{item[:dish]} - £#{item[:price]}"
    end
  end
end
