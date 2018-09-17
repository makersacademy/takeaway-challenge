class CustOrder

  attr_reader :menu

  def initialize(menu = jmenu)
    @menu = menu
  end

  def show_menu
    @menu.select { |menu_item|
      puts "#{menu_item[:platter]}: £#{menu_item[:price]}" 
    }
  end

  def dishlection(platter)
    @menu.select { |dish| dish if dish[:platter] == platter }
  end

private
  def jmenu
    [{ platter: 'Salmon Teriyaki Bento', price: 9.00, quantity: 0 }, 
              { platter: 'Chicken Gyoza 5pcs', price: 4.50, quantity: 0 },
              { platter: 'Spicy Beef Ramen', price: 8.00, quantity: 0 }]
  end
end
