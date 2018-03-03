require 'order'

describe Order do
  it 'Should initialize with an empty current_order' do
    expect(subject.current_order).to eq []
  end

  describe '#order_item' do
    it 'Should add item as string to current order' do
      subject.order_item("fake-item")
      expect(subject.current_order).to eq(["fake-item"])
    end
  end

  describe '#remove_item' do
    it 'Should remove item as string from current order' do
      subject.order_item("fake-item")
      subject.remove_item("fake-item")
      expect(subject.current_order).to eq []
    end
  end
end
