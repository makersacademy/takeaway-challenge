class Takeaway
def initialize(menu:)
  @menu = menu
end

def print_menu
  menu.print
end

private

attr_reader :menu

end


# def menu
# menu = [ 'Edamame', 'Vegetabe spring roll', 'Salmon roll', 'Cucumber roll']
# end
#
# def price(food)
# menu[0] = 2
# menu[1] = 3
# menu[2] = 4
# menu[3] = 4
# end
