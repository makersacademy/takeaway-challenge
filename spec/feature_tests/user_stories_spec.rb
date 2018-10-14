require 'menu'
require 'order'
require 'send_sms'

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
describe Menu do
  let(:menu) { Menu.new(items) }
  let(:items) { [{ "Margherita" => 8 }, { "Roasted Vegetable" => 9 }, { "Chorizo" => 12 }] }

  describe '#initialize' do
    it 'should show a list of dishes with prices' do
      expect(menu.items).to eq items
    end
  end
end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
describe Order do
  let(:order) { Order.new(menu.new) }
  let(:items) { [{ "Margherita" => 8 }, { "Roasted Vegetable" => 9 }, { "Chorizo" => 12 }] }
  let(:menu) { double(:menu, new: items) }

  describe '#choose' do
    it 'lets me choose the item that I want' do
      expect(order.choose("Margherita")).to eq ["Margherita"]
    end

    it 'should let me choose multiple items from the menu' do
      order.choose("Margherita")
      expect(order.choose("Chorizo")).to eq ["Margherita", "Chorizo"]
    end

    it 'should not allow me to choose items that are not on the menu' do
      expect { order.choose("Toast") }.to raise_exception "This item is not on the menu: choose something else"
    end
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  describe '#place_order' do
    it 'shows the items you have ordered, and the total cost' do
      order.choose("Roasted Vegetable")
      order.choose("Chorizo")
      expect(order.confirm_order).to eq "You have ordered: Roasted Vegetable and Chorizo. Total due: £21"
    end
    it 'shows the item you have ordered, and the total cost' do
      order.choose("Roasted Vegetable")
      expect(order.confirm_order).to eq "You have ordered: Roasted Vegetable. Total due: £9"
    end
    before do
      allow(order).to receive(:send_message)
    end
    it 'sends a confirmation message' do
      order.choose("Roasted Vegetable")
      expect(order).to receive(:send_message)
      order.confirm_order
    end
  end
end

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

describe SendSMS do
  let(:confirmation) { Order.new(menu.new) { include SendSMS } }
  let(:menu) { double(:menu, new: items) }
    let(:items) { [{ "Margherita" => 8 }, { "Roasted Vegetable" => 9 }, { "Chorizo" => 12 }] }

  describe '#time' do
    it 'tells me the time that my order was placed' do
      time = Time.new + 3600
      expect(confirmation.time). to eq time.strftime("%k:%M")
    end
  end
end
