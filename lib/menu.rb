require_relative 'takeaway'

class Menu

  def initialize
    #think about importing dishes(csv?) later but get everthing else working for now
    @dishes = {'Hamburger': 2.00,
               'Cheeseburger': 5.00,
               'Veggie Burger': 5.00,
               'Hot dog': 3.50,
               'Fries': 2.00,
               'Beer': 3.00}
  end

  def show
    @dishes.each do |food, price|
      puts "#{food}: " + ("£%.2f" % [price])
    end
  end

  def do_we_have(item)
    @dishes.has_key?(item.to_sym)
  end

  def price(dish)
    @dishes.fetch(dish.to_sym)
  end

end
