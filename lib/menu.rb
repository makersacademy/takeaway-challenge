class Menu
  attr_reader :available_dishes

  def initialize
    @dishes = [
      { name: 'pizza', price: 9.50 ,available: true },
      { name: 'pasta', price: 8.20 ,available: true },
      { name: 'tiramisu', price: 4.50 ,available: false }
    ]
    @available_dishes = filter_dishes_by_available
  end

  def display_available_dishes
    display_dishes = []

    available_dishes.each do |dish| 
      name = dish[:name]
      price = dish[:price]

      display_dishes << [name, price]
    end

    display_dishes
  end

  private

  attr_accessor :dishes
  attr_writer :available_dishes

  def filter_dishes_by_available
    self.available_dishes = dishes.select { |dish| dish[:available] == true}
  end
end
