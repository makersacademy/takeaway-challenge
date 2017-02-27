require_relative 'dish'
require_relative 'order'
require_relative 'sms'

class Menu

  require 'csv'

  attr_reader :current_order, :list

  def initialize
    @list = []
    load_menu
  end

  def view_menu
    sections = get_dish_type
    sections.each do |type|
      print_menu_section(type)
      list.each { |item|
        if item[:type] == type
          print_dish(item)
        end}
    end
    return
  end

  def load_menu (filename = 'menu.csv')
    CSV.foreach(filename) do |line|
      number, name, description, price, type = line
      @list << {:number => number.to_i, :name => name, :description => description, :price => price, :type => type}
    end
  end

  private

  def get_dish_type
    list.map do |dish|
      dish[:type]
    end.uniq
  end

  def print_dish(item)
    puts "#{item[:number]}. #{item[:name]} - £#{item[:price]}".center 70
    puts "#{item[:description]}".center 70
    puts
  end

  def print_menu_section(type)
    puts "#{type}".center 70
    puts
  end
end
