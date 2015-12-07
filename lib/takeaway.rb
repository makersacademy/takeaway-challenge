class Takeaway



def initialize
  @menu = {
            Pizza:  9.99
           }

  @order = []

end





def show_menu
  @menu.map.each {|item , price|  "#{item} : £#{price}" }.join
end

def place_order(item,quantity)
  @order << [item,quantity]


end

end
