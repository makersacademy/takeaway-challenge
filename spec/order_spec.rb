require 'order'

describe Order do

  subject(:order) { described_class.new }

  before(:each) do
    order.add_dish(1, 'Hedgeree')
  end

  describe '#add_dish' do
    it 'adds the dish to the basket' do
      expect(order.basket).to(have_key('Hedgeree'))
    end

    it 'adds correct number of dishes to basket' do
      order.add_dish(2, 'Hedgeree')
      expect(order.basket['Hedgeree']).to eq 3
    end
  end

  describe '#total' do
    it 'sums all items in basket' do
      order.add_dish(1, 'Hedgeree')
      expect(order.total).to eq 15.3
    end
  end

  # describe '#summary' do
  #   it 'provides a summary of current order' do
  #     order.add_dish(1, 'Hedgeree')
  #     order.add_dish(1, 'Banana Chowder')
  #     order.summary
  #     expect(STDOUT).to include('Hedgeree x 2 = £15.3')
  #   end
  # end

end
