class Menu
  MENU = [{ name: "Red Curry", price: 6 },
          { name: "Pad Thai", price: 5 },
          { name: "Vegetable Spring Roll", price: 1 }].freeze

  def list_of_dishes
    MENU.each { |dish| puts "#{dish[:name]}: £#{dish[:price]}" }
  end
end
