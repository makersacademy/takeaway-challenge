class BillCalculator
  attr_accessor :total, :order

  def initialize
    @total = 0
    @order = []
  end

  def store_order(dishes)
    dishes.each do |k,v|
      if k == "Hamburger"
        hamburger_total = v*5
        @order << "#{k} (£5) x #{v} = £#{hamburger_total}"
      elsif k == "Pizza"
        pizza_total = v*6
        order << "#{k} (£6) x #{v} = £#{pizza_total}"
      elsif k == "Pasta"
        pasta_total = v*4
        order << "#{k} (£4) x #{v} = £#{pasta_total}"
      elsif k == "Fish and chips"
        fishchipstotal = v*5
        order << "#{k} (£5) x #{v} = £#{fishchipstotal}"
      elsif k == "Salad"
        saladtotal = v*3
        order << "#{k} (£3) x #{v} = £#{saladtotal}"
      elsif k == "Lamb shank"
        lambtotal = v*7
        order << "#{k} (£7) x #{v} = £#{lambtotal}"
      end
    end
  end

end
