
describe 'User Stories' do

  let(:takeaway) { Takeaway.new }
  let(:menu) {Menu.new}
  let(:order) {Order.new}
  let(:item) { 'Satay' }
  let(:quantity) { 3 }

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

it 'allows customers to view a menu pricelist' do
  expect{ menu.pricelist }.not_to raise_error
end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

describe 'Order' do
  describe '#add' do
    it 'allows a customer to add an item to the basket' do
      expect { order.add(item) }.not_to raise_error
    end

    it 'stores an added item in the basket' do
      order.add(item)
      expect(order.basket).to have_key(item)
    end

    it 'allows a customer to add multiples of an item' do
      order.add(item, quantity)
      basket = { item => quantity }
      expect(order.basket).to eq basket
    end

    it 'stores an added item in the basket with a default of 1' do
      order.add(item)
      basket = { item => 1 }
      expect(order.basket).to eq basket
    end

    it 'adds to the quantity of an item if it is already in the order' do
      3.times { order.add(item) }
      basket = { item => 3 }
      expect(order.basket).to eq basket
    end
  end
end


  # it 'allows a customer to add multiple of an item to the basket' do
  #   takeaway.add_to_order(item)
  #   takeaway.add_to_order(item)
  #   expect(takeaway.basket).to eq { {satay = price: 4, qty: 2} }
  # end
#
# xit 'allows a customer to remove an item from the basket' do
#   takeaway.remove(item)
#   expect(basket.remove).not_to include(item_info)
# end
#
# # As a customer
# # So that I can verify that my order is correct
# # I would like to check that the total I have been given matches the sum of the various dishes in my order
#
# it 'allows a customer to review items in the basket' do
#   takeaway.add_to_order(item)
#   expect(takeaway.basket).to eq item_info
# end
#
# xit 'allows a customer to check the total bill' do
#   takeaway.add_to_order(item)
#   takeaway.add_to_order(item2)
#   takeaway.add_to_order(item3)
#   expect(takeaway.total).to eq total
# end
#
# xit 'raises an error if the total does not equal the sum of items in the basket' do
#   basket.total to raise_error
# end
#
#
# xit 'allows a customer to place the order' do
# end
#
#   context 'when an order is placed' do
#   # As a customer
#   # So that I am reassured that my order will be delivered on time
#   # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
#
#     xit 'outputs a confirmation message when an order is placed' do
#     end
#
#     xit 'sends a confirmation via text message when an order is placed' do
#     end
#   end
end
