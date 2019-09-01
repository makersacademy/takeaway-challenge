require './lib/menu'
require './lib/order'


describe Order do
  it " checks order selection is put into shopping cart" do
    subject.select_food("peking duck", 3)
    expect(subject.shopping_cart.length).to eq (1)
  end

  it "checks total price for specific items" do
    subject.select_food("peking duck", 3)
    puts subject.shopping_cart
    expect(subject.shopping_cart.length).to eq (1)
  end
end
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  # let(:dishes){ double :dishes}


# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
#
# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
