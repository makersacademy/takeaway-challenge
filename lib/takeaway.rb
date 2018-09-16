class Takeaway
  attr_reader :order

  def initialize
    @menu = {
      "fish and chips" => '£3.20', 
      "burger and chips" => '£4.20', 
      "chips" => '£1'
    }

    @order = {}
  end
  
  def menu
    @menu.each {|k, v| puts "#{k} - #{v}"}
  end

  def add_meal(meal_selection)
      @menu.each do | k, v |
        if k == meal_selection
          @order.store(k, v)
        end
      end
  end
end 
