class Takeaway

  attr_reader :menu_list
  def initialize
    @menu_list = {
      3 => ["rice"],
      4 => ["chicken"],
      5 => ["salad"],
      2 => ["cola"]}

    @dishes = []
    @quantity = []
    @sum = []
    @total = 0
    @exact_total = []

  end

  def menu
    @menu_list
  end

  def order(dish, quantity)
     @dishes << dish
     @quantity << quantity
     p "dishes"
     p @dishes
     p "quantity"
     p @quantity
  end

  def customer_total(sum)
    @sum << sum
    sum
  end

  def exact_total
    @dishes.each do |food|
      @menu_list.map do |key, value|
        if @menu_list[key].include?(food)
          @total =+ key * @quantity.last
            @exact_total << @total
            end
          end
        end
        @exact_total.reduce :+
        end

end
