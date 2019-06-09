class List

attr_reader :menu, :recipt, :dish_name, :quantity

  def initialize
    @menu = { "chinese" => 10, "pierogi" => 8, "curry" => 9, "carbonara" => 11, "salad" => 6 }
    @recipt = {}
  end

  def show_menu
    @menu
  end

  #def add_dish#(dish_name, quantity_of_dishes)
    # expect(list.key).to eq(key) key in the hash - this is imaginative draft
  def add_dish( dish_name, quantity )
    @dish_name = dish_name
    @quantity = quantity
    @recipt[@dish_name] = quantity
    @recipt
    "You just have added to your order #{quantity} of #{dish_name}(s)"
  end

  # def add_dish(dish_name)
  #     @dish_name = dish_name
  #     @recipt << @dish_name
  # end


  # def add_dish(@menu[dish_name])
  #   receipt[@menu[dish_name]
  # end

  def show_recipt
    @recipt
  end
end
