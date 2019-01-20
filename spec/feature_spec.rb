require 'order_processor'

feature "OrderProcessor" do

  before(:each) do
    @fish_dish = Dishes.new("Fish", 3)
    @list_of_dishes = ListOfDishes.new
    @order_processor = OrderProcessor.new(@list_of_dishes)
    @dishes_by_order_numbers = ["Fish: £3", "Pasta: £10"]
  end

  # it "should return a list of dishes" do
  #   @list_of_dishes.add_dish(fish_dish, toast_dish)
  #   expect(@list_of_dishes.list_of_dishes).to eql([fish_dish, toast_dish])
  # end
  #
  # it "should return a list of dishes by numbers" do
  #   @list_of_dishes
  #   expect(@list_of_dishes.list_by_dish_numbers(1, 3)).to eql(["Fish: £3", "Pasta: £10"])
  # end

  it "should return the order number and price" do
    @list_of_dishes.add_dish(@fish_dish)

    allow(Array).to receive(:each).with(1).and_return("Order 1. Fish: £3.00")

    @list_of_dishes.list_by_dish_numbers(1)
  end

  it "should find the price of the fish dish when calling 'total price'" do
    @list_of_dishes.add_dish(@fish_dish)
    @order_processor.add_order(1, 3)

    expect(@order_processor.overall_price).to eql(9.0)
  end

  it "should raise error for incorrect total price and order expected by customer" do
    @list_of_dishes.add_dish(@fish_dish)
    @list_of_dishes.add_dish(Dishes.new("Toast", 5))
    @order_processor.add_order(1, 1)
    @order_processor.add_order(2, 1)
    expect { @order_processor.execute_order(3, 10) }.to raise_error("Incorrect order!")
  end

end
