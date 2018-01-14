require_relative 'order'

class OrderPrinter
  def initialize(dish_list_printer)
    @dish_list_printer = dish_list_printer
  end

  def print(order)
    raise "Invalid order" unless order.is_a? Order
    @dish_list_printer.print(order.items)
    puts "Total...£%.2f" % order.total
    puts "Order placed at...#{order.time.strftime('%d-%m-%Y %H:%M:%S')}"
  end
end