class Menu

  def initialize
    @dishes = [
      { name: 'Margherita', price: 5.5 },
      { name: 'Pepperoni', price: 6.0 },
      { name: 'Veggie', price: 6.5 },
      { name: 'Hawaiian', price: 6.5 },
      { name: 'Meat Feast', price: 7.5 }
    ]
  end

  def select(order)
    items = order.items.split(', ')
    select_items(items)
  end

  def to_string
    @dishes.map { |dish| "#{dish[:name]}, £#{dish[:price]}0" }.join("\n")
  end

  private

  def select_items(items)
    items_ordered = []
    items.each do |item|
      @dishes.select do |dish|
        items_ordered << dish if dish[:name] == item
      end
    end
    items_ordered
  end
end
