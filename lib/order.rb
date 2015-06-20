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
      @selection[pizza] = updated_values_for_select(pizza, number)
      @total = calc_total
    else
      temp_total = @menu[pizza]*number
      @selection[pizza] = [number, temp_total]
      @total = calc_total

    end

  end

  def remove pizza, number
    select(pizza, -1 * number)
    @total = calc_total
  end

  private

  def pizza_already_selected? pizza
    @selection.keys.include?(pizza)

  end

  def updated_values_for_select pizza, number
    temp_number = number + @selection[pizza][0]
    temp_total = @menu[pizza]*temp_number
    [temp_number, temp_total]

  end

  def calc_total
    @selection.inject(0) {|total,(pizza,values)| total + values[1]}

  end


end

menu = Menu.new
p menu.view
order = Order.new(menu)
order.select(:pepperoni,5)
p order.view_selection
p order.view_total
order.select(:margharita,7)
p order.view_selection
p order.view_total
order.select(:pepperoni,3)
p order.view_selection
p order.view_total
order.remove(:margharita, 3)
p order.view_selection
p order.view_total



