class Menu
  attr_reader :order

  def initialize
    @dishes = {
      "Pasta alla carbonara" => 5.60,
      "Risotto alla milanese" => 6.40,
      "Cotoletta alla milanese" => 7.10,
      "Pollo alla cacciatora" => 7.50,
      "Torta paesana" => 4.10,
      "Caffè" => 0.90
    }
    @order = []
  end

  def view
    @dishes.each do |dish, price|
      puts "#{dish}: £#{price.to_f}"
    end
  end

  # issue: it would add anytihng, including items outside of @dishes
  def choose(*items)
    items.each do |item|
      @order << item
    end
  end

  def show
    puts @order
  end
end
