class Order
attr_reader :order
  def initialize(menu = Menu.new)
    @order = []
    @menu = menu
  end

  def request_item(*item)
    item.each do |item|
      @order << @menu.choose_item(item)
    end
  end

  def total_price
    @total_price = @order.map{|items| items.values}.flatten.reduce(:+)
  end

  def print_menu
    @menu.print_menu
  end

  def print_order
    quantities = Hash.new(0)
    @order.each {|items,count| quantities[items]+= 1}
    quantities.sort_by {|items, count| count}.reverse!.each{|key,value| puts "#{value}x #{key.keys[0]}".ljust(15) + "£#{key.values[0]*value}".rjust(10)}
    puts "\nTotal: £#{total_price}"
  end
end
