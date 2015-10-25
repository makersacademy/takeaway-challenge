class Order

  attr_reader :items
  def initialize (menu_klass = Menu.new)
    @items = Hash.new(0)
    @menu_klass = menu_klass
  end

  def add_item (name, quantity = 1)
    raise "Sorry we don't have #{name} on the menu" unless item_on_menu?(name)
    @items[name] += quantity
    puts "#{quantity} #{name}(s) added to your order"
  end

  def total_price
    total = 0
    @items.each { |name, quantity| total += (quantity * price_matcher(name)) }
    total
  end

  private

  def item_on_menu?(name)
    @menu_klass.dishes.include?(name)
  end

  def price_matcher(name)
    @menu_klass.dishes[name]
  end


end
