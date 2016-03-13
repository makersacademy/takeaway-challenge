require 'order'

describe Order do
  subject(:order){described_class.new(current_order_class)}
  let(:current_order_class){double :current_order_class, new: current_order}
  let(:current_order){double :current_order, new_item: nil, order: nil}
  let(:item){double :item}
  let(:value){double :value}

  describe '#new_order' do
    it 'creates a current order list' do
      expect(current_order_class).to receive(:new)
      order.new_order(item,value)
    end

    it 'pushes items to current order' do
      expect(current_order).to receive(:new_item).with({item => value})
      order.new_order(item,value)
    end
  end

  describe '#review_order' do
    it 'gets current order' do
      expect(current_order).to receive(:order_review)
      order.review_order
    end
  end

  describe '#complete' do
    it 'Pushes order into completed order' do
      order.new_order(item,value)
      order.completed
      expect(order.completed_order).to eq [current_order]
    end

    it 'Removes current order once complete' do
      order.new_order(item,value)
      order.completed
      expect(current_order_class).to receive(:new)
      order.new_order(item,value)
    end
  end

end
