class Takeaway

  attr_reader :order, :overall_total, :current_total

  def initialize(dishes = {})
    @dishes = dishes
    @order = []
    @current_total = 0
    @overall_total = 0
  end

  def see_dishes
    @dishes.each { |name, price| puts "#{name.capitalize} - £#{price}" }
  end

  def add_dish(item, quantity)
    @current_total = 0
    quantity.times{@order << item}

    @order.each do |dish|
      @current_total += @dishes[dish]
    end

    puts "Current order total is £#{@current_total}."
  end

  def check_order_price
    @overall_total = 0
    @order.each do |dish|
      @overall_total += @dishes[dish]
    end

    puts "Final order total is £#{@overall_total}."
  end


end
