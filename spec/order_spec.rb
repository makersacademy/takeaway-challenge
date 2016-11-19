require './lib/order'

describe Order do

  let(:order) { described_class.new }
  let(:current_selection) { double(:current_selection) }

  context 'Initialization' do

    it 'creates an empty basket on initialization' do
      expect(order.basket).to eq []
    end

    it 'creates a total of zero on initialization' do
      expect(order.total).to eq 0
    end

  end

  context 'Basket' do

    it { is_expected.to respond_to(:add_to_basket) }

    it 'allows users to add items to basket' do
      order.add_to_basket(current_selection)
      expect(order.basket).to eq [current_selection]
    end

  end

# I would like to check that the total I have been given
# matches the sum of the various dishes in my order

  context 'Calculate Total' do

    it 'calculates total cost' do
      order.add_to_basket({:item=>"pizza", :price=>4, :qty=>3})
      order.add_to_basket({:item=>"spag_bol", :price=>6, :qty=>3})
      order.add_to_basket({:item=>"chips", :price=>3, :qty=>1})
      expect(order.calculate_total).to eq 33
    end

  end

end
