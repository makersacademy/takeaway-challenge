class Takeaway

  attr_reader :items

  def initialize(items, menuprinter = MenuPrinter)
    @items = items
    @menuprinter = menuprinter.new
  end

  def make_selection(selection, basket_printer = BasketPrinter)
    validate_selection(selection)
    basket_printer.new(selection, items)
  end

  def show_items
    @menuprinter.print_items(items)
  end

  def validate_selection(selection)
    hash?(selection)
    quantity?(selection)
    items_availabe?(selection)
  end

  private

  def hash?(selection)
    fail "selection must be hash" unless selection.is_a?(Hash)
  end

  def quantity?(selection)
    selection.each_pair do |_key, value|
      fail "each item must have quantity" unless value.is_a?(Integer)
    end
  end

  def items_availabe?(selection)
    selection.each_pair do |key, _value|
      fail "not all items available" unless items.include?(key)
    end
  end
end
