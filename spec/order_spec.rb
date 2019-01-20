require 'order'

describe Order do
  let(:item) { double(:item, to_sym: :item) }
  let(:menu) { double(:menu, view_food_and_price: {item: 7.7}) }
  let(:order) { described_class.new(menu) }

  context '#item_is_on_menu' do
    before(:each) do
      allow(menu).to receive_message_chain("view_food_and_price.include?") { true }
    end

    it 'should by default return an empty basket' do
      expect(order.basket).to eq []
    end

    it 'should store an item which has been added to the basket' do
      order.add_to_order(:item, 1)
      expect(order.basket).to eq [:item]
    end

    it 'should add the item the quantity number of times' do
      expect(order.add_to_order(item, 2)).to eq [item, item]
    end

    it 'should return the full price of the order' do
      order.add_to_order(item, 1)
      expect { order.total_price }.to change { order.price }
    end

    it 'should return the price once calcualted' do
      order.add_to_order(item, 1)
      expect(order.total_price).to be_an_instance_of Float
    end
  end

  context '#item_isnt_on_menu' do
    before(:each) do
      allow(menu).to receive_message_chain("view_food_and_price.include?") { false }
    end

    it 'should return a message if the item if not on the menu' do
      expect(order.add_to_order(item, 2)).to eq "Sorry but this is not on our menu."
    end
  end
end
