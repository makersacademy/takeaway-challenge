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

# User Story 3:
# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order

  it "should be able to check the total returned matches the sum of the dishes" do
    takeaway.place_order("Chicken",3)
    takeaway.place_order("Beef",3)
    expect(takeaway.basket_summary).to eq "Chicken x3 = £16.50, Beef x3 = £10.80"
  end

# User Story 4:
# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

end
