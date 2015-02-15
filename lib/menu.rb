class Menu
  attr_reader :dishlist, :ordered

  def initialize
    @dishlist = []
    @ordered = []
  end

  def add_dish(dish)
    @dishlist << dish    
  end

  def custom_order(orders, total)
   if total == orders.length
        orders.each {|order| @ordered << order}
        process_order
      else raise 'Please check the sum of your ordered dishes'
    end
  end

  def process_order
    #pass into kitchen, get delivery_time
    #send text
  end



end