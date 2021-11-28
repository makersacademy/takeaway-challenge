require_relative 'dish'

class Takeaway

  attr_reader :menu

  def initialize
    create_menu
    @menu = {}
    @my_choices = []
  end

  def create_menu
    5.times do 
      price = rand(1..10)
      number = rand(1..52)
      name = "Curry #{number}"
      @menu[name] = price
      @menu << Dish.new(name,price)
    end
  end

  def add_item(name,price)
    @menu[name] = price
    @menu_objects << Dish.new(name,price)
  end

  def see_menu
    @menu.each do |name, price|
      puts "#{name},#{price}"
  end

  def choose_dish(name)
    puts "You've chosen #{name!}"
    @my_choices << name
  end

  def calculate_total
    @total = 0
    @my_choices.each do |name|
      @total += @menu[name]
    end
  end

  def make_order
    calculate_total
    @my_choices.each do |name|
      final << name + @menu[name].to_s
    end
    @final_order = final.join(",")
  end

  def send_text
  end
end