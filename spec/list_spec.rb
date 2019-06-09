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

  #recipt

  it "contains an recipt of ordered dishes"do
    list = List.new
    expect(list.recipt).to eq({})
  end

  it "responds to method #show_recipt" do
    list = List.new
    expect(list).to respond_to(:show_recipt)
  end

  it "shows recipt" do
    list = List.new
    expect(list.show_recipt).to eq(list.recipt)
  end


  #add_dish

  it "responds to the method #add_dish" do
    list = List.new
    expect(list).to respond_to(:add_dish).with(2).arguments
  end

  xit "adds a new dish to the recipt" do #I keep this test as temporarly pending for future learning purposes. It is not to be run in the code at any stage.
    list = List.new
    dish_name = "pierogi"
    quantity = 2
    expect(list.add_dish(dish_name, quantity)).to eq(list.recipt)

    dish_name = "pierogi2" #here I check what would happen if two dishes were added
    quantity = 4
    expect(list.add_dish(dish_name, quantity)).to eq(list.recipt)
    #it is ok, because the recipt also changes after the first dish was added so the test passes
  end

  it "adds a new dish to the recipt and prints the summary of last order "do
    list = List.new
    dish_name = "pierogi"
    quantity = 2
    expect(list.add_dish(dish_name, quantity)).to eq("You just have added to your order #{quantity} of #{dish_name}(s)")
  end

  #raise error if the dish is not in the menu
end




  #it "takes a dish and adds it to the receipt" do
  #   list = List.new
  #   list.show_menu =
  #
  # end
