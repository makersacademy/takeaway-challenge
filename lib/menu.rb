class Menu
  attr_reader :items

  def initialize
    @items = {}
    # @items = { "Cod" => 4, "Sausage" => 3, "Chips" => 2 }
  end

  def view
    @items.inject("") { |out, (dish, price)| out << "#{dish} £#{price}\n" }
  end

  def add dish
    @items.merge! dish
  end

  def remove dish
    @items.delete dish
  end
end
