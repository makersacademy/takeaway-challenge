
class Order
  attr_accessor :total_order, :confirmation

  def initialize(list = ListofDishes.new)
    @list = list
    @total_order = []
    @confirmation
  end

  def order
    loop do
      @list.print_menu
      order = gets.chomp.capitalize
      self.make_order(order)
      if order == "finish" 
        break
      end
    end
  end

  def make_order(dish)
    if @list.list_of_dishes.include?(dish) 
      @total_order << @list.list_of_dishes.assoc(dish) 
    elsif 
      dish == "finish"
      return @total_order
    elsif
      !@list.list_of_dishes.include?(dish) 
        raise("Dish not found!")
    end
  end

  def print_total_order
    list_order = @total_order.flatten
    total = 0
    list_order.keep_if { |element| element.is_a?(Integer) }
    list_order.each { |num| total += num }
    puts "Your order: #{list_order}" 
    p "Total = #{total}"
  end

  def confirm_order
    puts "If you happy with your order type Y to confirm or N to continue ordering"
    @confirmation = gets.chomp.capitalize
    @confirmation == "Y" ? @confirmation : self.order
  end
end