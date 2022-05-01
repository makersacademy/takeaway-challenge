class Menu
  DEFAULT_DISHES = [
    { name: 'pizza', price: 9.50 ,available: true },
    { name: 'pasta', price: 8.20 ,available: true },
    { name: 'tiramisu', price: 4.50 ,available: false }
  ]

  attr_reader :dishes, :available_dishes

  def initialize(dishes = DEFAULT_DISHES)
    @dishes = dishes
    @available_dishes = filter_dishes_by_available
  end

  def display_available_dishes
    available_dishes
  end

  private

  attr_accessor :dishes
  attr_writer :available_dishes

  def filter_dishes_by_available
    self.available_dishes = dishes.select { 
      |dish| dish[:available] == true }

    format_available_dishes
  end

  def format_available_dishes
    formatted_available_dishes = {}

    self.available_dishes = available_dishes.each do |dish| 
      formatted_available_dishes.merge!(dish[:name] => dish[:price])
    end

    formatted_available_dishes
  end
end