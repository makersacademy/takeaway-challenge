class Menu

  attr_reader :dishes

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
    select_items(order)
  end

  def to_string
    @dishes.map { |dish| "#{dish[:name]}, £#{dish[:price]}0" }.join("\n")
  end

  private

  def select_items(items, ordered = [])
    items.each do |item|
      @dishes.each do |dish|
        ordered << { name: dish[:name], quantity: item[1] } if dish[:name].casecmp(item[0].downcase).zero?
      end
    end
    ordered
  end
end
