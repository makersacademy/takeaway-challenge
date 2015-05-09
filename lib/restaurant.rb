
class Restaurant

  attr_accessor :menu, :order, :total_amount

  def initialize
    @menu = {
      :Beef_BBQ => 15,
      :Chicken_Supreme => 16,
      :Hawaiian => 14,
      :Margherita => 12,
      :Pepperoni => 16,
      :Texan_BBQ => 15,
      :Tuna_Sweetcorn => 17,
      :Vegetable => 16
      }
      @order = []
      @total_amount = 0
    end
  end