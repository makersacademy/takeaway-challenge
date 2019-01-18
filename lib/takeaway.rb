class Takeaway

  attr_reader :items
  def initialize(printer = Printer)
    @items = []
    @printer = printer.new
  end

  def add_item(item)
    check_item(item)
    @items << item
  end

  def show_items
    @printer.print_items(items)
  end

  private
  def check_item(item)
    raise "must have item name" if item[:name].nil?
    raise "must have item price" if item[:price].nil?
  end
end
