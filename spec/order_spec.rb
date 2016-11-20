require './lib/order'

describe Order do

  let(:order) { described_class.new }
  let(:takeaway) { double(:takeaway) }

  before do
    allow(takeaway).to receive(:accept_order)
  end

  context 'Initialization' do

    it 'creates an empty basket on initialization' do
      expect(order.basket).to eq []
    end

    # it 'creates an empty current selection' do
    #   expect(menu.current_selection).to eq ({})
    # end

  end

  context 'Selection' do

    it 'can add item, price and quantity to current selection' do
      order.select_item("Pizza", 3)
      expect(order.current_selection).to eq ({:item=>"Pizza", :qty=>3})
    end

    it 'adds a default quantity if no quantity is given' do
      order.select_item("Pizza")
      expect(order.current_selection).to eq ({:item=>"Pizza", :qty=>Order::DEFAULT_QUANTITY})
    end

    it 'confirms items that have been added to basket' do
      expect(order.select_item("Pizza", 3)).to eq "3x Pizza added to your basket"
    end

  end

  context 'Basket' do

    it 'allows users to add items to basket' do
      order.select_item("Pizza")
      expect(order.basket).to eq [{:item=>"Pizza", :qty=>1}]
    end

  end

  context 'Place Order' do

    it 'responds to place order method' do
      expect(order).to respond_to(:place_order)
    end

  end

end
