require_relative 'menu'

class Order

  def initialize (menu)
    @menu = menu.view
    @selection = {}
    @total = 0.0

  end

  def view_selection
    @selection.clone

  end

  def view_total
    copy = @total.to_s
    copy.to_f

  end

  def select pizza, number

    if pizza_already_selected? pizza
      temp_number = number + @selection[pizza][0]
      @selection.delete(pizza)
      temp_total = @menu[pizza]*temp_number
      @selection[pizza] = [temp_number, temp_total]
      @total += @menu[pizza]*number
    else
      temp_total = @menu[pizza]*number
      @selection[pizza] = [number, temp_total]
      @total += temp_total

    end

  end

  def remove pizza, number
    temp_number = @selection[pizza][0] - number
    @selection.delete(pizza)
    temp_total = @menu[pizza]*temp_number
    @selection[pizza] = [temp_number, temp_total]
    @total -= @menu[pizza]*number

  end

  private

  def pizza_already_selected? pizza
    @selection.keys.include?(pizza)

  end

end

# menu = Menu.new
# p menu.view
# order = Order.new(menu)
# order.select(:pepperoni,5)
# p order.view_selection
# p order.view_total
# order.select(:margharita,7)
# p order.view_selection
# p order.view_total
# order.select(:pepperoni,3)
# p order.view_selection
# p order.view_total
# order.remove(:margharita, 3)
# p order.view_selection
# p order.view_total



