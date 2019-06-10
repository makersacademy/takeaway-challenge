require 'list'

describe List do

  #menu

  it "contains a menu" do
    list = List.new
    expect(list.menu).to eq({ "chinese" => 10, "pierogi" => 8, "curry" => 9, "carbonara" => 11, "salad" => 6 })
  end

  it "responds to the method #show_menu" do
    list = List.new
    expect(list).to respond_to(:show_menu)
  end

  it "shows the menu" do
    list = List.new
    expect(list.show_menu).to eq({ "chinese" => 10, "pierogi" => 8, "curry" => 9, "carbonara" => 11, "salad" => 6 })
  end

  #receipt

  it "contains an receipt of ordered dishes"do
    list = List.new
    expect(list.receipt).to eq({})
  end

  it "responds to method #show_receipt" do
    list = List.new
    expect(list).to respond_to(:show_receipt)
  end

  it "shows receipt" do
    list = List.new
    expect(list.show_receipt).to eq(list.receipt)
  end


  #add_dish

  it "responds to the method #add_dish" do
    list = List.new
    expect(list).to respond_to(:add_dish).with(2).arguments
  end

  #it "adds a new dish to the receipt" do #I keep this test as temporarly pending for future learning purposes. It is not to be run in the code at any stage.
    #list = List.new
    # dish_name = "pierogi"
    # quantity = 2
    # expect(list.add_dish(dish_name, quantity)).to eq(list.receipt)
    #
    # dish_name = "pierogi2" #here I check what would happen if two dishes were added
    # quantity = 4
    # expect(list.add_dish(dish_name, quantity)).to eq(list.receipt)
    #it is ok, because the receipt also changes after the first dish was added so the test passes
  # end

  it "adds a new dish to the receipt and prints the summary of last order "do
    list = List.new
    dish_name = "pierogi"
    quantity = 2
    expect(list.add_dish(dish_name, quantity)).to eq("You just have added to your order #{quantity} portions of #{dish_name}(s)")
  end

  it " tries to add a dish that is not in the menu "do
    list = List.new
    dish_name = "kotlety"
    quantity = 2
    expect(list.add_dish(dish_name, quantity)).to eq("This dish is not in the menu")
  end

  it "responds to #check_if_in_the_menu"do
    list = List.new
    expect(list).to respond_to(:check_if_in_the_menu)
  end

  it "checks if it is possible to place an order" do
    list = List.new
    dish_name = "pierogi"
    expect(list.check_if_in_the_menu(dish_name)).to eq(true)
  end

  it "checks if it is NOT possible to place an order" do
    list = List.new
    dish_name = "kotlety"
    expect(list.check_if_in_the_menu(dish_name)).to eq(false)
  end

  it "responds to the method #order_summary" do
    list = List.new
    expect(list).to respond_to(:order_summary)
  end

  it "responds to the method #order_summary" do
    list = List.new
    expect(list).to respond_to(:order_summary)
  end

  it "shows the order summary with the sum to pay" do
    list = List.new
    dish_name = "pierogi"
    quantity = 2
    sum = list.menu[dish_name] * quantity
    list.add_dish(dish_name, quantity)
    expect(list.order_summary).to eq("You ordered #{quantity} portions of #{dish_name}(s). The sum to pay is #{sum},")
  end

  it "shows the total price for the order" do
    list = List.new
    list.add_dish("chinese", 3)
    list.add_dish("curry", 4)
    price_for_chinese = list.menu["chinese"] * 3
    price_for_curry = list.menu["curry"] * 4
    total_price = price_for_chinese + price_for_curry
    expect(list.total).to eq("Total price for the order #{total_price}")

  end
end
