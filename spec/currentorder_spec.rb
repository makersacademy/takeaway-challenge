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

  describe '#order_review' do
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

  describe '#order_review' do
    it 'returns each item cost' do
      currentorder.new_item(order)
      expect(currentorder.order_review).to eq 'eggs' + " cost: " + '4'
    end
  end



end
