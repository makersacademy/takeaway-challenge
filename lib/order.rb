

class Order
  attr_reader :items

  def initialize
    @items = []
  end

  def show
    @items.each do |item|
      item.each { |name, price| puts "#{items.index(item) + 1}. #{name} - £#{price}" }
    end
  end

  def total
    @items.reduce(0) { |total, item| total + item.values.last}
  end
end