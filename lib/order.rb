class Order

  attr_reader :total_price, :items

  def initialize
    @total_price = 0
    @items = []
  end

  def add(item, quantity =1)
    quantity.times {@items << item}
  end

  def remove(item, quanity =1)
    quanity.times do
      return unless @items.include?(item)
      @items.delete_at(@items.index(item))
    end
  end


end
