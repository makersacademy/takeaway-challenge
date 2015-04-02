class Menu
  attr_reader :items

  def initialize
    @items = {}
  end

  def view
    @items.reduce("") { |out, (dish, price)| out << "#{dish} £#{price}\n" }
  end

  def add dish
    @items.merge! dish
  end

  def remove dish
    @items.delete dish
  end
end
