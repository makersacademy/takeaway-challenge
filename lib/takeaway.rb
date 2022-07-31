class Takeaway 
attr_reader :menu

  def initialize(menu:)
    @menu = menu 
    # adds a menu attribue to the Takeaway class/object
  end
  
  def print_menu
    # will print the menu
     menu.print
    # menu.print_menu
  end


end



# then create a test to show a litst of dishes and prices
# do this in the form of a array of hases
# eg [ {dish: "", price: integer here}]
