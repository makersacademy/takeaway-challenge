
#Knows about the list of dishes
class Menu

  def initialize(dishes)
    @dishes = dishes
  end

  def self.build_default_menu
    dishes = [{:name => "Pasta", :price => 10},
             {:name => "Pizza", :price => 15},
             {:name => "Wrap", :price => 8},
             {:name => "Muffin", :price => 4}]
    new(dishes)
  end

  def print_menu
    dishes.each { |dish| puts "#{dish[:name].ljust(15,'.')} £#{dish[:price]}" }
  end

  private

  attr_reader :dishes

end
