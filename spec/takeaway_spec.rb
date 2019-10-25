require "./docs/takeaway"

describe TakeAway do

  before(:each) do
    @takeaway = TakeAway.new
  end

  it "can display the menu to the user" do
    expect(@takeaway.menu).to eq({ "Salmon sushi" => 2.99,
                                  "Vegetable sushi" => 1.99,
                                  "Rice" => 1.59,
                                  "Katsu chicken" => 2.99 })
  end
  
  context "user has ordered several items"
    before(:each) do
        @takeaway.order(2, "Salmon sushi")
        @takeaway.order(3, "Katsu chicken")
        @takeaway.order(2, "Rice")
    end

  it "allows the user to order from the dishes available" do
    expect(@takeaway.total_order).to eq("2 x Salmon sushi: £5.98\n3 x Katsu chicken: £8.97\n2 x Rice: £3.18\n")
  end
end
