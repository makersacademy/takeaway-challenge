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

  private

  attr_reader :items
end
