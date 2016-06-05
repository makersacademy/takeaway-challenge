
#Knows about the list of dishes, with their names and prices
class Menu

  def initialize(dishes)
    @dishes = dishes
  end

  def self.build_default_menu
    dishes = [{:name => "pasta", :price => 10},
             {:name => "pizza", :price => 15},
             {:name => "wrap", :price => 8},
             {:name => "muffin", :price => 4}]
    new(dishes)
  end

  def print_menu
    dishes.each { |dish| puts "#{dish[:name].capitalize.ljust(15,'.')} £#{dish[:price]}" }
  end

  def price_total(order)
    total = 0
    order.each do |single_order|
     number = single_order[0].to_i
     dish_name = single_order[1].downcase
      number.times do
        selected_dish = dishes.select{ |dish| dish.has_value?(dish_name)}
        total += selected_dish[0][:price]
      end
    end
    total
  end






  private

  attr_reader :dishes

end
