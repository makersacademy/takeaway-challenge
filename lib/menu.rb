require_relative 'menu_item'
require 'csv'

class Menu

  DEFAULT_FILENAME = './lib/takeaway_menu.csv'
  attr_reader :m_items

  def initialize
    @m_items = {}
  end

  def load_from_csv
    @m_items = {}
    CSV.foreach(DEFAULT_FILENAME, headers: true) do |row|
      @m_items[row["number"]] = MenuItem.new(number: row["number"], dish: row["dish"], price: row["price"])
    end
  end

  def display
    @m_items.each_value do | item |
      puts "#{item.number}. #{item.dish.capitalize.ljust(22, " ")} £#{item.price.rjust(6, " ")}"
    end
  end
end
