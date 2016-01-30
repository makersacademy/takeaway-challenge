
ItalianFood = Struct.new :dish, :price

class Menu

attr_reader :selection, :cuisine_choice, :order

  def initialize(cuisine_choice=ItalianFood)
    @cuisine_choice = cuisine_choice
    @selection = []
    @order = order
    #will inject order_klass later?
  end

  # def display(menu)
  # Will display the menu using nice layout for the food with prices
  # end
  #
  # def select(dish, quantity)
  # Will let the
  # end
  #
  # def confirm_order
  #   will initialize a order.new with the information from def.select
  #
  # end
  #
  # def bill
  # => will retrieve info from order
  # end



end
