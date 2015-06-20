class Order

  attr_accessor :complete 

  def initialize (menu)
    @menu = menu.view
    @order = {}
    @total = 0.0
    @complete = false

  end

  def view_order
    @order.clone

  end

  def view_total
    copy = @total.to_s
    copy.to_f

  end

  def add pizza, number
  	raise 'order has already been completed' if complete
    raise 'item not on menu' if !@menu.include?(pizza)
    raise 'invalid number' if number % 1 != 0

    if pizza_already_selected? pizza
      @order[pizza] = updated_values_for_add(pizza, number)
      @total = calc_total
    else
      temp_total = @menu[pizza]*number
      @order[pizza] = [number, temp_total]
      @total = calc_total

    end

  end

  def remove pizza, number
  	raise 'order has already been completed' if complete
    raise 'invalid number' if number > @order[pizza][0]
    add(pizza, -1 * number)
    @total = calc_total
  end

  private 

  def pizza_already_selected? pizza
    @order.keys.include?(pizza)

  end

  def updated_values_for_add pizza, number
    temp_number = number + @order[pizza][0]
    temp_total = @menu[pizza]*temp_number
    [temp_number, temp_total]

  end

  def calc_total
    @order.inject(0) {|total,(pizza,values)| total + values[1]}

  end


end







