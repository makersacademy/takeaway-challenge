require_relative 'formatter.rb'

class Menu

  def initialize(item_list, formatter = Formatter.new)
    @menu = item_list
    @formatter = formatter
  end

  def show_dishes
    @menu.each do |item|
      puts "#{item.name}: #{@formatter.price(item.price)}"
    end
  end

  def check(poss_item)
    @menu.each { |item| return true if poss_item == item.name }
    false
  end

  def select(correct_item)
    @menu.select { |item| item.name == correct_item }
  end

end
