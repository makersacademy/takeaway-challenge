require_relative 'menu.rb'
require_relative 'SMS.rb'

class Order

  attr_reader :selection, :dishes, :total

  def initialize
    @selection = []
    @dishes = Menu.new.dishes
    @total = 0
  end

  def view_menu
    Menu.new
  end

  def add(dish_index)
    @selection << @dishes[dish_index -1]
    @total += @dishes[dish_index -1][:price]
    @selected_dish = @dishes[dish_index -1][:smoothie]
    item_added_confirmation
  end

#bit of a problem in that I can only get the sequence below to work if
#the methods are on the same line (otherwise rspec just calls the last one)
#and as a result I can't give the check_order_prompt, show the selection, show the total
#and then prompt the user to confirm checkout... I could of course just
#tell them to run the method to complete checkout but I assume we're not assuming
#a user is using ruby to place their order... though I guess we weren't assuming
#a user was using ruby to literally land a plane, so...

  def checkout
    p check_order_prompt, @selection, total_summary
    # checkout_confirmation
  end

  def check_order_prompt
    "Please check your order against your total:"
  end

  def selection_summary
    @selection
  end

  def total_summary
    "Your total is: £#{@total}."
  end

  # def checkout_confirmation
  #   p "Please enter #complete order to complete your order"
  #   user = gets.chomp
  #   if user == "complete order"
  #     "order complete!"
  #   end
  # end

  def item_added_confirmation
    "You successfully added #{@selected_dish} to your basket"
  end
end
