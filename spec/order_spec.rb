require './lib/order'

describe Order do

  let(:order)     { described_class.new }
  let(:item)      { double(:item) }
  let(:quantity)  { double(:quantity) }

  context 'Basket' do

    it 'creates an empty basket on initialization' do
      expect(order.basket).to eq []
    end

    it { is_expected.to respond_to(:add_to_basket) }

    it 'allows users to add items to basket' do
      order.add_to_basket(item, quantity)
      expect(order.basket).to eq [item, quantity]
    end

  end

# I would like to check that the total I have been given
# matches the sum of the various dishes in my order

  context 'Validate Order' do

    # it 'presents a list of items in basket to a user' do
    #   expect(order.validate_order).to eq "Item: #{item}, "
    #
    #
    # end



  end

end
