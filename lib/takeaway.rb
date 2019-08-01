class Takeaway

# attr_reader :printed_menu
#   @printed_menu = {
#   yummyfood1: 1,
#   yummyfood2: 2}

def initialize(menu = Menu.new)
  @menu = menu
end


  def print_menu
    @menu.print
  end
end








#
# attr_reader :menu, :order
#
#  @menu = {
# yummyfood1: 1,
#  yummyfood2: 2}
#
#
#
#
#   def print_menu
#     menu.print
#   end
#
#   def order(dish)
#
#   end
#
#
# private
#
#   attr_reader :menu
# end
