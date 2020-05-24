require_relative 'formatter.rb'

class Menu

  def initialize(item_list, formatter = Formatter.new)
    @menu = item_list
    @formatter = formatter
  end

  def show_dishes
    @menu.each do |item|
      puts "#{item.name}: #{@formatter.format(item.price)}"
    end
  end

  def check(poss_item)
    @menu.each { |item| return true if poss_item == item.name }
    false
  end

  def select
    @menu.select{ |item| item.name == user_input[0] }
  end

end
