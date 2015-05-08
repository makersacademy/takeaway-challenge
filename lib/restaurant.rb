require_relative 'customer'
class Restaurant

  attr_accessor :menu

  def initialize
    @menu = {
      :Beef_BBQ => 15.99,
      :Chicken_Supreme => 16.99,
      :Hawaiian => 14.99,
      :Margherita => 12.99,
      :Pepperoni => 16.99,
      :Texan_BBQ => 15.99,
      :Tuna_Sweetcorn => 17.99,
      :Vegetable => 16.99
      }
    end
end