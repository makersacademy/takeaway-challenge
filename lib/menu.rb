class Menu

  MENU = [
          {name: 'sushi', price: 7},
          {name: 'ramen', price: 12},
          {name: 'soup', price: 4.5},
          {name: 'fish and chips', price: 10},
          {name: 'bread', price: 3},
          {name: 'olives', price: 1.5}
          ].freeze

  def show_menu
    menu = ''
    MENU.each {|item| menu << "#{item[:name]}: £#{item[:price]}\n"}
    menu
  end

  def find_price(dish)
    MENU.each {|item| dish[:price] = item[:price] if item[:name] == dish[:name]}
    dish
  end
end
