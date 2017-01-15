describe "Users Stories" do

subject(:takeaway){ Takeaway.new }
let(:menu) { double :menu }
# User Story 1:
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
  it "should return a list of dishes with prices" do
    allow(takeaway).to receive(:get_menu).and_return(menu)
    expect(takeaway.get_menu).to eq menu
  end
# User Story 2:
# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
  it "should be able to place an order for one or more dishes on the menu" do

  expect(takeaway.place_order("Chicken", 1)).to eq("1x Chicken(s) added to your basket")

  expect(takeaway.place_order("Lamb", 2)).to eq("2x Lamb(s) added to your basket")

  end

end
