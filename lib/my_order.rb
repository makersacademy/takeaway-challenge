class MyOrder

  attr_reader :my_order, :menu

  def initialize(menu = Menu.new, text = Text.new)
    @my_order = []
    @menu = menu
    @calculated_total = 0
    @actual_total = 0
    @text = text
  end

  def show_order
    @my_order.each do |dish|
      p "Number #{dish[:number]}".center(10) + "||".center(5) + "#{dish[:dish]}".center(15) + "£#{dish[:price]}".center(15)
    end
  end

  def select_dish(dish_number)
    @menu.dishes.each do |dish|
      if dish[:number] == dish_number
        @my_order << dish
      end
    end
  end

  def print_total
    @my_order.each do |dish|
      @calculated_total += dish[:price]
    end
    p @calculated_total
  end

  def check_total
    @my_order.each do |dish|
      p dish[:price]
      @actual_total += dish[:price]
    end
    p "Actual total: #{@actual_total}"
    p "Calculated total: #{@calculated_total}"
    raise "Incorrect total" if @actual_total != @calculated_total
    "Total is correct"
  end

  def place_order
    @text.send
  end

end
