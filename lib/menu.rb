class Menu
  include Enumerable
  extend Forwardable

  def_delegators :items, :each, :include?, :member?, :empty?

  def self.from_hash(hash)
    menu = Menu.new
    hash.each { |name, price| menu.add(name, price) }
    menu
  end

  def initialize
    @items = {}
  end

  def add(name, price)
    items[name] = price
  end

  def price_of(name)
    items[name]
  end

  def to_s
    string = ""
    padding = max_item_name_length + 1
    each do |name, price|
      string << line_item_string(padding, name, price)
    end
    string
  end
  private

  attr_reader :items

  def max_item_name_length
    map { |name, value| name.length }.max
  end

  def line_item_string(padding, name, price)
    "%-#{padding}s\t£%6.2f\n" % [name.to_s + ':', price]
  end
end
