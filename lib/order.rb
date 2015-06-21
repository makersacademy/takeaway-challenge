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
    else
      raise 'invalid number' if number <= 0
      temp_total = @menu[pizza]*number
      @order[pizza] = [number, temp_total]
    end

    remove_zero_quantity_pizzas
    @total = calc_total

  end

  def remove pizza, number
    add(pizza, -1 * number)
  end

  private

  def remove_zero_quantity_pizzas
  	@order.each do |i|
  	@order.delete(i[0]) if i[1][0] == 0
  	end


  end

  def pizza_already_selected? pizza
    @order.keys.include?(pizza)

  end

  def updated_values_for_add pizza, number
    temp_number = number + @order[pizza][0]
    raise 'invalid number' if temp_number < 0
    temp_total = @menu[pizza]*temp_number
    [temp_number, temp_total]
  end

  def calc_total
    @order.inject(0) {|total,(pizza,values)| total + values[1]}

  end


end


