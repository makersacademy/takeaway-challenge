RSpec.describe 'User stories' do

# Version 1
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

  it 'shows menu' do
    menu = Menu.new
    expect { menu.display }.to output(/Menu/).to_stdout
  end

# Version 2
# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
  # context "when creating a new order for a margarita pizza" do
  #   let(:order) { Order.new("margarita") }
  #
  #   it 'should have 1 margarita pizza in the basket' do
  #     expect(order.basket).to eq([{dish: margarita, quantity: 1}])
  #   end
  #
  #   it 'should have a total of £9' do
  #     expect(order.total).to eq(9)
  #   end
  #
  #   it 'should keep a list of the items ordered and their quantity' do
  #     order.add("margarita")
  #     expect(order.basket).to include("margarita")
  #   end
  #
  #
  #
  # end

end
