class BillCalculator
  attr_accessor :total, :order
  attr_writer :meal_options

  def initialize(meal_options)
    @meal_options = meal_options
    @total = 0
    @order = []
  end

  def calculate_total(dishes)
    dishes.each do |k,v|
      if k == @meal_options.keys[0]
        @total += v * @meal_options.values[0]
      elsif k == @meal_options.keys[1]
        @total += v * @meal_options.values[1]
      elsif k == @meal_options.keys[2]
        @total += v * @meal_options.values[2]
      elsif k == @meal_options.keys[3]
        @total += v * @meal_options.values[3]
      elsif k == @meal_options.keys[4]
        @total += v * @meal_options.values[4]
      elsif k == @meal_options.keys[5]
        @total += v * @meal_options.values[5]
      end
    end
  end


  def store_order(dishes)
    dishes.each do |k,v|
      if k == @meal_options.keys[0]
        hamburger_total = v*@meal_options.values[0]
        @order << "#{k} (£#{@meal_options.values[0]}) x #{v} = £#{hamburger_total}"
      elsif k == @meal_options.keys[1]
        pizza_total = v*@meal_options.values[1]
        @order << "#{k} (£#{@meal_options.values[1]}) x #{v} = £#{pizza_total}"
      elsif k == @meal_options.keys[2]
        pasta_total = v*@meal_options.values[2]
        @order << "#{k} (£#{@meal_options.values[2]}) x #{v} = £#{pasta_total}"
      elsif k == @meal_options.keys[3]
        fishchipstotal = v*@meal_options.values[3]
        @order << "#{k} (£#{@meal_options.values[3]}) x #{v} = £#{fishchipstotal}"
      elsif k == @meal_options.keys[4]
        saladtotal = v*@meal_options.values[4]
        @order << "#{k} (£#{@meal_options.values[4]}) x #{v} = £#{saladtotal}"
      elsif k == @meal_options.keys[5]
        lambtotal = v*@meal_options.values[5]
        @order << "#{k} (£#{@meal_options.values[5]}) x #{v} = £#{lambtotal}"
      end
    end
  end

end
