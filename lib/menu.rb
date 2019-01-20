class Menu

attr_accessor :items

  def initialize(items = @items)
    @items = [{item: :pie, price: 2.95},
              {item: :cod, price: 6.00},
              {item: :haddock, price: 6.25},
              {item: :fishcake, price: 2.25},
              {item: :sausage, price: 1.60},
              {item: :chips, price: 2.20},
              {item: :scampi, price: 6.10} ]
  end

  def print
    formatted_menu
  end


  private

  def formatted_menu
    items.each_with_index do |hash, index|
      puts "#{index + 1}. #{hash[:item]} --- £#{hash[:price]}"
    end
  end

end
