require_relative 'dish'
require_relative 'twilioruby'
require 'env'

class Takeaway

  attr_reader :menu, :my_choices

  def initialize
    @menu_object = []
    @menu = { "Bryani" => 7, "Curry" => 9, "Beef" => 10, "Shrimp" => 11, "Korma" => 4 }
    @my_choices = []
    @texter = SendMeAText.new
  end

  def add_item(name,price)
    @menu[name] = price
    @menu_object << Dish.new(name,price)
  end

  def see_menu
    @menu.each do |name, price|
      puts "#{name},#{price}"
    end
    return @menu
  end

  def choose_dish(name)
    if @menu[name].nil?
      puts "That's not a menu option! We don't sell that"
      @my_choices
    else
      puts "You've chosen #{name}!"
      @my_choices << name
    end
  end

  def calculate_total
    @total = 0
    @my_choices.each do |name|
      @total += @menu[name]
    end
  end

  def make_order
    final = []
    calculate_total
    @my_choices.each do |name|
      final << name + "," + @menu[name].to_s
    end
    @final_order = final.join(":")
    puts @final_order
    return @final_order
  end

  def send_text(texter = @texter)
    texter.send_text
  end
end
