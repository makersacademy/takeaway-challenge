class Menu
  MENU_TITLE = 'Menu List:'
  private_constant :MENU_TITLE
  def initialize
    @menu_list = [
      { number: 1, name: 'Curry', price: 5, quantity: 1 },
      { number: 2, name: 'Rice', price: 2, quantity: 1 },
      { number: 3, name: 'Naan bread', price: 2, quantity: 1 }
    ]
  end

  def display
    puts MENU_TITLE
    @menu_list.each.map { |dish| puts formatted_display(dish) }.join("\n")
  end

  def choose(number)
    @menu_list.fetch(number-1)
  end

  private

  def formatted_display(dish)
    "#{dish[:number]}. #{dish[:name]} - £#{dish[:price]}"
  end
end
