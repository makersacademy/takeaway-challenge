class Menu
  attr_reader :menu

  def initialize
    @menu = menu
  end

  def menu
    menu = [
      { item: "Noodles", price: 6.00 },
      { item: "Prawn Cocktail", price: 3.80 },
      { item: "Prawn Crackers", price: 1.80 },
      { item: "Deep Fried Seaweed", price: 4.00 }
    ]
  end

  def show_menu
    @menu.collect.with_index { |k, i| "#{i + 1}. #{k[:item]}: £#{k[:price]}" }
  end

  def select
    @menu = @menu[0, 2]
  end

  def order_total
    @menu = @menu.map { |k| k[:price] }.inject(:+)
    "Your total is £#{@menu}0."
  end
end
