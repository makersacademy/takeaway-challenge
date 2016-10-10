class Menu

  attr_accessor :menu

  def initialize
    @menu = [ {name: 'Rice',     price: 1.50},
              {name: 'Nann',     price: 3.00},
              {name: 'Tikka',    price: 5.00},
              {name: 'Korma',    price: 5.00},
              {name: 'Jalfrezi', price: 6.00},
              {name: 'Bahji',    price: 3.00}
            ]
  end

  def add_dish(dish, price)
    hash = Hash.new
    hash[:name] = dish
    hash[:price] = price
    @menu.push(hash)
  end

  def remove_dish(dish)
    @menu.delete_if { |h| h[:name] == dish }
  end

  def show_menu
   @menu.dup
  end



end
