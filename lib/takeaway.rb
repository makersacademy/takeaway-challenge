class Takeaway

  attr_reader :order

  def initialize(dishes = {})
    @dishes = dishes
    @order = []
    @current_total = 0
  end

  def see_dishes
    @dishes.each { |name, price| puts "#{name.capitalize} - £#{price}" }
  end

  def add_dish(item, quantity)
    quantity.times{@order << item}

    @order.each do |dish|
      @current_total += @dishes[dish]
    end

    puts "Current order total is £#{@current_total}."
    @current_total = 0
  end



  # def show_order
  #
  # end

end
