class List

attr_reader :menu, :receipt, :dish_name, :quantity

  def initialize
    @menu = { "chinese" => 10, "pierogi" => 8, "curry" => 9, "carbonara" => 11, "salad" => 6 }
    @receipt = {}
  end

  def show_menu
    @menu
  end

  #def add_dish#(dish_name, quantity_of_dishes)
    # expect(list.key).to eq(key) key in the hash - this is imaginative draft
  def add_dish( dish_name, quantity )
      @dish_name = dish_name
      @quantity = quantity
      if check_if_in_the_menu(@dish_name) == false
        return "This dish is not in the menu"
      end
      @receipt[@dish_name] = quantity
      @receipt
      "You just have added to your order #{quantity} portions of #{dish_name}(s)"
    end

  def check_if_in_the_menu(dish_name)
    @dish_name = dish_name
    if @menu.key?(@dish_name) == false
      false
    else
      true
    end
  end

  def order_summary #should not have any input
      #@receipt.values #quantity_of_dishes
    summary = ''
    @receipt.each do |dish, quantity|
      price_for_type_of_dish = @menu[dish] * quantity
      summary += "You ordered #{quantity} portions of #{dish}(s). The sum to pay is #{price_for_type_of_dish},"
    end

    return summary
  end


  def total #should not have any input
      #@receipt.values #quantity_of_dishes
    total_price = 0
    @receipt.each do |dish, quantity|
      price_for_type_of_dish = @menu[dish] * quantity
      total_price += price_for_type_of_dish
    end

  "Total price for the order #{total_price}"



    # price
    # sum = price * @quantity
    # sum
  end

  # def add_dish(dish_name)
  #     @dish_name = dish_name
  #     @receipt << @dish_name
  # end


  # def add_dish(@menu[dish_name])
  #   receipt[@menu[dish_name]
  # end

  def show_receipt
    @receipt
  end
end
