class Takeaway

  attr_reader :order

  def initialize

    @menu = { "Apple Pie" => 4.5,
      "Banana Pie" => 4.5,
      "Tiramisu" => 5}

    @order = {}

  end

  def print_menu

    @menu.each do |name, price|
      puts "#{name}: #{price}"
    end

  end

  def add_to_order (dish, quantity)

    fail 'Not part of the menu' unless dish_on_menu?(dish)
    @order[dish] = quantity

  end

  def dish_on_menu?(dish)

    @menu[dish]

  end

end
