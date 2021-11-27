class Order
  attr_reader :items

  def initialize
    @items = []
  end

  def summary
    @items.each do |item|
      item.each { |name, price| puts "#{name} - £#{price}" }
    end
    true
  end

  def total
    "Total: #{@items.reduce(0) { |total, item| total + item.values.last}}"
  end
end