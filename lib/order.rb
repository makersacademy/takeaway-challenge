class Order
  def initialize menu
    @menu = menu
    @dishes = Hash.new(0)

    puts menu.list_dishes
    select_dishes
  end

  def update_order
    puts summary
    puts @menu.list_dishes
    select_dishes
  end

  def summary
    string = "Summary:\n"
    @dishes.each do |dish, quantity|
      hash = { quantity: quantity, name: dish.name, price: dish.price * quantity }
      string << "%<quantity>d x %<name>s (%<price>.2f)\n" % hash
    end
    string << "Total: %.2f" % [total]
  end

  def total
    @dishes.reduce(0) { |res, (dish, quantity)| res + (dish.price * quantity) }
  end

  private

  def select_dishes
    while (dish_number, quantity = dish_and_quantity)
      dish = @menu.select_dish dish_number
      @dishes[dish] += quantity
    end
  end

  def dish_and_quantity
    dish_number = user_input "Please pick a dish (enter 0 to see the menu again): "
    return nil unless dish_number

    prompt = "How many #{@menu.select_dish(dish_number).name} would you like to add: "
    dish_quantity = user_input prompt
    [dish_number, dish_quantity]
  end

  def user_input prompt
    input = 0
    while input.zero?
      print prompt
      input = check_input
      break unless input
    end
    input
  end

  def check_input
    input = STDIN.gets.chomp
    puts @menu.list_dishes if input == "0"
    return false if input.empty?

    input.to_i
  end
end
