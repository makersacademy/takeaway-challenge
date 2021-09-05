class Restaurant

  attr_reader :menu, :basket

  def initialize
    @menu = {
      "Chicken Souvlaki Wrap" => 8,
      "Haloumi Souvlaki Wrap" => 7,
      "Falafel Souvlaki Wrap" => 7,
      "Chips" => 4,
      "Water" => 1,
      "Coke" => 2
    }
    @basket = Hash.new(0)
  end
  
  def show_menu
    @menu.each { |dish, price| puts "#{dish} - £#{price}" } 
  end

  def add_dish(dish, quantity = 1)
    @basket[dish] += quantity
  end

  def order_summary
    @basket.each { |dish, quantity| puts "#{quantity}X #{dish} = £#{@menu[dish] * quantity}" }
    total_cost
  end

  private

  def total_cost
    total = 0
    @basket.each { |dish, quantity| total += @menu[dish] * quantity }
    puts "Total: £#{total}"
  end
end
