class Takeaway

  attr_reader :order

  def initialize(dishes = {})
    @dishes = dishes
    @order = []
  end

  def see_dishes
    @dishes.each { |name, price| puts "#{name.capitalize} - £#{price}" }
  end

  def add_dish(item, quantity)
    quantity.times{@order << item}
  end



  # def show_order
  #
  # end

end
