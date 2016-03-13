require 'currentorder'

describe CurrentOrder do
  subject(:currentorder){described_class.new}
  let(:order){double:order}

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




end
