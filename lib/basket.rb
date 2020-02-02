class Basket

  attr_reader :dishes # , :quantities, :estimated_total
  
  def initialize(menu)
    @dishes = []
    @menu = menu
    # @quantities = []
  end

  def add(dish, quantity = 1)
    @menu.search(dish)
    quantity.times { @dishes << dish }
  end  
  
  def remove(dish, quantity = 1)
    quantity.times do
      @dishes.delete_at(@dishes.index(dish)) if @dishes.include?(dish)
    end
  end

  def total
    total_cost = 0
    @dishes.each { |dish| total_cost += @menu.dishes[dish.to_sym] }
    total_cost
  end
  
  def summary
    summary = ""
    @dishes.uniq.each do |dish|
      summary += "#{dish.capitalize} x #{@dishes.count(dish)}: "\
        "£#{@menu.dishes[dish] * @dishes.count(dish)}\n"
    end
    summary += "Total: £#{total}\n"
  end

end
