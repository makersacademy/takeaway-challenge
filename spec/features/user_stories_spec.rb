
describe 'User Stories' do

  let(:takeaway) { Takeaway.new }
  let(:menu) { Menu.new }
  let(:order) { Order.new }
  let(:checkout) { Checkout.new }
  let(:item) { Item.new('Satay', 4.50) }
  let(:item2) { Item.new('Spring rolls', 3.00) }
  let(:quantity) { 3 }
  let(:food) { 'Satay' }
  let(:random_food) { Item.new('Turkish Delight', 4.00) }

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

describe 'Menu' do
  describe '#get_item' do
    it 'can look up an item' do
      expect(menu.get_item(food).name).to eq food
    end

    it 'raises an error if the item is not on the menu' do
      expect{ menu.get_item(random_food.name) }.to raise_error 'Sorry we don\'t have that on our menu'
    end
  end

  describe '#add and #remove' do
    it 'can have more items added to the menu' do
      menu.add(random_food)
      expect(menu.items).to include random_food
    end

    it 'can have items removed from the menu' do
      menu.add(random_food)
      menu.remove(random_food.name)
      expect(menu.items).not_to include random_food
    end
  end
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

    it 'adds up the total cost of items in the basket' do
      3.times { order.add(item) }
      4.times { order.add(item2) }
      expect(order.total).to eq (3*item.price + 4*item2.price)
    end
  end

  describe '#remove' do
    it 'allows a customer to remove an item from the basket' do
      order.add(item)
      order.remove(item)
      expect(order.basket).to eq ({})
    end

    it 'reduces the quantity by 1' do
      2.times { order.add(item) }
      order.remove(item)
      expect(order.basket).to eq ({item => 1})
    end

    it 'raises an error if customer tries to remove an item not in basket' do
      expect{order.remove(item)}.to raise_error 'Item not in basket'
    end
  end

  describe '#confirm' do
    it 'outputs a delivery time message when an order has been placed' do
      delivery_time = (Time.new + 3600).strftime("%H:%M")
      message = "Thank you! Your order was placed and will be delivered by #{delivery_time}"
      expect(order.confirm).to eq message
    end
  end
end

  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

  describe 'Sms' do
    xit 'sends an SMS confirmation when an order is placed' do
    end
  end
end

# # As a customer
# # So that I can verify that my order is correct
# # I would like to check that the total I have been given matches the sum of the various dishes in my order

# xit 'raises an error if the total does not equal the sum of items in the basket' do
#   basket.total to raise_error
# end
#
