require './lib/order'

describe Order do

  let(:order) { described_class.new }
  let(:current_selection) { double(:current_selection) }
  let(:takeaway) { double(:takeaway) }

  before do
    allow(takeaway).to receive(:accept_order)
  end

  context 'Initialization' do

    it 'creates an empty basket on initialization' do
      expect(order.basket).to eq []
    end

    it 'creates a total of zero on initialization' do
      expect(order.total).to eq 0
    end

  end

  context 'Basket' do

    it 'allows users to add items to basket' do
      order.add_to_basket(current_selection)
      expect(order.basket).to eq [current_selection]
    end

  end

  # context 'Calculate Total' do
  #
  #   it 'calculates total cost' do
  #     order.add_to_basket({:item=>"pizza", :price=>4, :qty=>3})
  #     order.add_to_basket({:item=>"spag_bol", :price=>6, :qty=>3})
  #     order.add_to_basket({:item=>"chips", :price=>3, :qty=>1})
  #     expect(order.calculate_total).to eq "Total = £33"
  #   end
  #
  # end

  context 'Place Order' do

    it 'responds to place order method' do
      expect(order).to respond_to(:place_order)
    end

    it 'confirms that order has been placed' do
      expect(order.place_order).to eq "Order has been placed"
    end

  end

end
