class Menu
  attr_reader :selection

# add csv which will import menu

  def initialize
    @selection = selection
  end

  def selection
    items = [
            { name: :beef_curry, price: 5.70 },
            { name: :chicken_curry, price: 4.70 },
            { name: :veggie_curry, price: 4.70 },
            { name: :fish_curry, price: 4.70 },
            { name: :aloo_curry, price: 4.70 }
            ]
  end

  def print
    @selection.each do |item|
      STDOUT.puts "name: #{item[:name]}: price: #{item[:price]}"
    end
  end

end
