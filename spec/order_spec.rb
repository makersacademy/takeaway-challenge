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
end
