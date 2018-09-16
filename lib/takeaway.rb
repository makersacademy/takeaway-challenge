require 'twilio-ruby'

class Takeaway
  attr_reader :order, :total

  def initialize
    @menu = {
      "fish and chips" => 3.20, 
      "burger and chips" => 4.20, 
      "chips" => 1
    }

    @order = {}
    @total = 0
  end
  
  def menu
    @menu.each {|k, v| puts "#{k} - £%.2f" % v}
  end

  def add_meal(meal_selection, quantity)
    fail "Sorry that is not on the menu" unless @menu.has_key?(meal_selection)
    @menu.each do | k, v |
        if k == meal_selection
          k = k + ' x' + quantity.to_s
          v *= quantity
          @order.store(k, v)
        end
      end
    @total = "£%.2f" % ((@order.values.inject (:+)).to_s)
  end
  
end 
