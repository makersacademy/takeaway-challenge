class TakeAway

attr_reader :basket

def initialize(menu: Menu)
@menu = menu
@basket = []
end

def view_menu
 " "
end

def select(item)
@basket << item
end


end
