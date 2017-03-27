require_relative 'takeaway'

class Test
  def run
    dishes = {
      Katsu_Chicken_Wrap: 4.50,
      Roast_and_Toast_Small_Box: 3.99,
      Roast_and_Toast_Big_Boy_Box: 4.99
    }

    menu = Menu.new(dishes: dishes)

    makers_market = Takeaway.new(menu: menu)

    puts """
    Welcome to Makers Market takeaway

    Here is a list of dishes:

    #{makers_market.show_menu}

    What would you like to order?
    (Please follow the example format: 'Katsu_Chicken_Wrap: 3')
    """

    makers_market.place_order(gets.chomp)
  end
end
