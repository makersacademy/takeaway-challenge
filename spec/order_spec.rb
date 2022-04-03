require_relative '../lib/order'
require_relative '../lib/takeaway'

describe Order do
  let(:indian) { Menu.new }
  let(:langley) { Takeaway.new(indian) }
  let(:house) { Order.new(langley) }
  
  context '#initialize' do
    
    it 'accepts a takeaway class when it is initalized' do
      expect(house.takeaway_class).to be_an_instance_of Takeaway
    end

    it 'creates an empty array to store the order' do
      expect(house.final_order).to eq []
    end

  end

  context '#adding_to_an_order' do
  
    it 'let you add items to your order' do
      indian.add_item("Samosa", 2)
      house.item_selection(4, "Samosa")
      expect(house.final_order).to eq [{ no_items: 4, item: "Samosa", item_total: 8 }] 
    end
    it 'let you add items to your order' do
      indian.add_item("Samosa", 2)
      expect(house.item_selection(4, "Samosa")).to eq ("you have selected 4 x => Samosa's")
    end
    
    it 'raise an error if the item is not in the menu' do
       expect { house.item_selection(4,"Ladoo") }.to raise_error
    end
  end
  
  context '#verification_of_order' do

    it 'prints your order' do
      indian.add_item("Samosa", 2)
      house = Order.new(langley)
      house.item_selection(4, "Samosa")
      expect(house.verify_order).to eq ("Your total is : 8")
    end

  end

  context '#time_generator' do

    it 'genrates current time + 1 hour' do
      expect(house.time_generator).to eq(house.time)
    end

  end
  context '#sendsms' do

    it 'sends sms confirmation to the customer to confirm delivery time' do
      allow(house).to receive(:send_message) { "Thank you! Your order was placed and will be delivered before 19:26" }
      expect(house.send_message).to eq "Thank you! Your order was placed and will be delivered before 19:26"
    end

  end
end
