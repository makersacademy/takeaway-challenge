require 'csv'

class Menu
  attr_reader :dishes, :available_dishes

  def initialize(dishes_file = "./assets/dishes.csv")
    @dishes = []
    load_dishes(dishes_file)

    @available_dishes = filter_dishes_by_available
  end

  def display_available_dishes
    available_dishes
  end

  private

  attr_writer :dishes, :available_dishes

  def load_dishes(dishes_file)
    CSV.foreach(dishes_file, headers: true, header_converters: :symbol) do |row|
      name, price, available = row[:name], row[:price], row[:available]

      @dishes << { name: name.to_sym, price: price.to_f, available: true?(available) }
    end
  end

  def true?(available)
    available == "true"
  end

  def filter_dishes_by_available
    self.available_dishes = dishes.select do |dish| 
      dish[:available] == true
    end

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
