class Takeaway

attr_reader :menu

  def initialize
    @menu = {"Spring Rolls" => 4,
            "Crispy Prawns" => 5,
            "Pork Skewers" => 6,
            "Tom Yum" => 7,
            "Green Curry" => 7,
            "Chang Beer" => 2}
    @name
    welcome_message
  end

  def view_menu
    menu
  end

  def new_order(name)
  @name = Order.new(name)
  end

  def select_dish(dish_name)
    dish_and_price = @menu.select {|k,v| k == dish_name}
    @name.addto_order(dish_and_price)
  end

  private



  def welcome_message
    puts "Welcome to Tim's Thai"
  end

end
