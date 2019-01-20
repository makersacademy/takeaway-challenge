class Takeaway

  attr_reader :items

  def initialize(items, menuprinter = MenuPrinter)
    @items = items
    @menuprinter = menuprinter.new
  end

  def make_selection(selection, basket_printer = Basket)
    validate_selection(selection)
    basket_printer.new(selection, items).print_invoice
  end

  def show_items
    @menuprinter.print_items(items)
  end

  def validate_selection(selection)
    array?(selection)
    quantity?(selection)
    items_availabe?(selection)
  end

  private

  def array?(selection)
    fail "selection must be array" unless selection.is_a?(Array)
  end

  def quantity?(selection)
    selection.each do |choice|
      fail "each item must have quantity" if choice[:quantity].nil?
    end
  end

  def items_availabe?(selection)
    selection.each do |choice|
      fail "not all items available" unless list_of_items.include?(choice[:name])
    end
  end

  def list_of_items
    @items.map { |item| item[:name] }
  end
end
