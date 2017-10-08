class Takeaway

attr_reader :menu, :name

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

  def select_dish(dish_name, number)
    dish_and_price = @menu.select {|k,v| k == dish_name}
    number.times {@name.addto_order(dish_and_price)}
  end

  def verify_order
    "#{@name.dish_list} #{@name.total}"
  end

  private

  def welcome_message
    puts "Welcome to Tim's Thai"
  end

end
