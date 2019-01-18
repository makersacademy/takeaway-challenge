class Takeaway

  attr_reader :items

  def initialize(printer = Printer, items)
    @items = items
    @printer = printer.new
  end

  def make_selection(selection, basket_printer = BasketPrinter)
    validate_selection(selection)
    basket_printer.new(selection, items)
  end

  def show_items
    @printer.print_items(items)
  end

  def validate_selection(selection)
    is_hash?(selection)
    has_quantity?(selection)
    items_availabe?(selection)
  end

  private

  def is_hash?(selection)
    fail "selection must be hash" if !selection.is_a?(Hash)
  end

  def has_quantity?(selection)
    selection.each_pair do |key, value|
      fail "each item must have quantity" if !value.is_a?(Integer)
    end
  end

  def items_availabe?(selection)
    selection.each_pair do |key, value|
      fail "not all items available" if !items.include?(key)
    end
  end
end
