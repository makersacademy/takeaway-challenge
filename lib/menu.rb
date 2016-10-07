require_relative 'takeaway'

class Menu

attr_reader :dishes

  def initialize
    #think about importing dishes(csv?) later but get everthing else working for now
    @dishes = {'Hamburger': 2.00,
               'Cheeseburger': 5.00,
               'Veggie Burger': 5.00,
               'Hot dog': 3.50,
               'Fries': 2.00,
               'Beer': 3.00}
    @array = [1,2,3,4,5]
  end

  def show
    @dishes.each do |food, price|
      puts "#{food}: £#{price}"
    end
  end

  def do_we_have(item)
    @dishes.has_key?(item.to_sym)
  end
end
