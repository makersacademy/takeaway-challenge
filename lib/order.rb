class Order

  attr_reader :basket
  
  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
  end

  def show_menu
    @menu.view
  end

  def add_to_basket(id, qty = 1)
    item = @menu.select_item(id)
    @basket.any? { |arr| arr.include?(item) } ? update_item(item, qty) : add_item(id, qty)
  end

  def remove(id, qty = "none")
    # if time add a remove funtionality
    # removes selected quantity of item if qty argument given
    # if no qty given then remove the item
  end

  def summary
    return "No selections made" if @basket.empty?

    print_header
    print_selections
    print_total
  end

  def total
    @total = @basket.reduce(0) { |sum, a| sum + (a[0][:unit_price] * a[-1]) }
  end

  private

  def add_item(id, qty)
    @basket << [@menu.select_item(id), qty]
  end

  def update_item(item, qty)
    @basket.select { |arr| arr.include?(item) }.last[-1] += qty
  end

  def print_header
    msg = "ORDER SUMMARY"
    puts divider
    puts msg
    puts divider
  end

  def print_selections
    @basket = @basket.sort_by { |k| k[0][:id] }
    @basket.each { |k| puts "#{k[-1]} x #{k[0][:dish]} (£#{k[0][:unit_price]} each)" }
  end

  def print_total
    puts divider
    puts "TOTAL = £#{total}"
    puts divider
  end 

  def divider
    "-" * 15
  end
end
