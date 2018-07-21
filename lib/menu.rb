require 'json'

class Menu
  def initialize
    file = File.read('menu.json')
    @menu = JSON.parse(file, :symbolize_names => true)
  end

  attr_reader :menu

  def print_all
    puts ""
    @menu.each do |category, array_of_items|
      puts "#{category}".center(36)
      puts "--------------------".center(36)
      array_of_items.each do |item_hash|
        puts "#{item_hash[:name].rjust(24)}: £#{sprintf('%.2f', item_hash[:price])}"
      end
      puts ""
    end
  end

  def print_category(chosen_category)
    puts ""
    @menu.each do |category, array_of_items|
      if category.to_s == chosen_category
        puts "#{category}".center(36)
        puts "--------------------".center(36)
        array_of_items.each do |item_hash|
          puts "#{item_hash[:name].rjust(24)}: £#{sprintf('%.2f', item_hash[:price])}"
        end
        puts ""
      end
    end
  end

end
