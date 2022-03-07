class Restaurant

  attr_reader :menu
  def initialize(menu_data)
    @menu = menu_data || [{ name: "Egg Roll", price: 3 },
    { name: "Shrimp Roll", price: 4 }, 
    { name: "Boneless Spare Ribs", price: 9 }]
  end

  def show_menu
    @menu.each.with_index { |dish, i| puts "#{i + 1}. #{dish[:name]} | price: £#{dish[:price]}" }
  end
end
