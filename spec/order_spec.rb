require_relative '../lib/order'
require_relative '../lib/takeaway'

describe Order do
  let(:indian) { Menu.new }

  context '#initialize' do

    it 'accepts a takeaway class when it is initalized' do
      langley = Takeaway.new(indian)
      house = Order.new(langley)
      expect(house.takeaway_class).to be_an_instance_of Takeaway
    end
    it 'creates an empty array to store the order' do
      langley = Takeaway.new(indian)
      house = Order.new(langley)
      expect(house.final_order).to eq []
    end
  end

  context '#adding_to_an_order' do
    it 'let you add items to your order' do
      indian.add_item("Samosa", 2)
      langley = Takeaway.new(indian)
      house = Order.new(langley)
      house.item_selection(4, "Samosa")
      expect(house.final_order).to eq [{ no_items: 4, item: "Samosa", item_total: 8 }] 
    end
  end
  
  context '#verification_of_order' do
    it 'prints your order' do
      indian.add_item("Samosa", 2)
      langley = Takeaway.new(indian)
      house = Order.new(langley)
      house.item_selection(4, "Samosa")
      expect(house.verify_order).to eq ("Your total is : 8")
    end
  end

  context '#time_generator' do
    it 'genrates current time + 1 hour' do
      langley = Takeaway.new(indian)
      house = Order.new(langley)
      expect(house.time_generator).to eq(house.time)
    end
  end
  context '#sendsms' do
    it 'sends sms confirmation to the customer to confirm delivery time' do
      langley = Takeaway.new(indian)
      house = Order.new(langley)
      allow(house).to receive(:send_message) {"Thank you! Your order was placed and will be delivered before 19:26"}
      expect(house.send_message).to eq "Thank you! Your order was placed and will be delivered before 19:26"
    end
  end
end
