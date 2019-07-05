require_relative 'order'

class TakeAway

MENU = { hamburger: 4,
         hotdog: 3,
         pizza: 5,
         fried_chicken: 3
       }

  def view_dishes
    MENU.map do |x, y|
      "#{x.to_s.split('_').join(' ').capitalize} £#{y}"
    end
  end

  def order(new_order = Order.new)
    @current_order = new_order
    new_order.selection_header
    while new_order.order_complete? == false
      new_order.add_item(self)
    end
  end

  def menu
    MENU
  end

end

# takeaway = TakeAway.new
# takeaway.order
