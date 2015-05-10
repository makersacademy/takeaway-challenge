class Restaurant

attr_accessor :menu
attr_reader :dishes
attr_reader :choice
attr_reader :order

  def initialize(menu)
    @menu = menu.dishes
  end

  def receive_order(dishes)
    @dishes = dishes
    @choice = {}
    dishes.each do |dish|
      @menu.select { |k, v| @choice[k] = v if k == dish }
    end
   @choice
  end

  def calculate_order(amount)
    @order = []
    if amount.length == 1
      num = amount[0].to_i
      @dishes.each do |dish|
        num.times {@order << dish}
      end
    else
      amounts = Hash[@dishes.zip(amount)]
      amounts.each do |dish, amount|
        amount.times do
          @order << dish
        end
      end
    end
    @order
  end

end