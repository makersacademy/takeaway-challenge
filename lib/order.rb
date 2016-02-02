class Order
  extend Forwardable

  def_delegators :items, :each, :include?, :member?, :empty?

  attr_reader :customer

  def initialize(customer)
    @customer = customer
    @items = {}
  end

  def add(name, quantity = 1)
    items[name] = quantity_of(name) + quantity
  end

  def quantity_of(name)
    items[name] || 0
  end

  private

  attr_reader :items
end
