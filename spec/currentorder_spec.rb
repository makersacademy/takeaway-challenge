require 'currentorder'

describe CurrentOrder do
  subject(:currentorder){described_class.new}
  let(:order){double:order, {'eggs' => 4}}

  describe '#new_item' do
    it 'stores items ordered' do
      currentorder.new_item(order)
      expect(currentorder.current_order).to eq [order]
    end
  end

  describe '#current_order' do
    it 'stores items ordered' do
      currentorder.new_item(order)
      expect(currentorder.current_order).to eq [order]
    end
  end

  # describe '#order_review' do
  #   it 'returns the total cost' do
  #
  # end
  #


  # it 'raises error if item not on the item' do

  # it 'sums the correct total amount'

  # it returns the menu and cost



end
