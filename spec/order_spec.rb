require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:fake_item) { double("fake_item") }

  describe '#initialize' do
    it 'expects an array on initialize' do
      expect(order.current_order).to be_a(Array)
    end

    it 'should be an empty array' do
      expect(order.current_order).to be_empty
    end
  end

  describe '#add_item' do
    it 'adds an item to the order' do
      expect(order.add_item(fake_item)).to eq([fake_item])
    end

    it 'populates current order array' do
      order.add_item(fake_item)
      expect(order.current_order).to include(fake_item)
    end

    # it 'increases quantity if item is already present in order' do
    #   fake_item_with_quantity = double("Item", { name: "Fake_Item_Name", quantity: 0 })
    #   expect { 2.times { order.add_item(fake_item_with_quantity) } }.to change { fake_item_with_quantity.quantity }.from(0).to(2)
    # end
  end

  describe '#remove_item' do
    it 'raises an error if list is already empty' do
      fake_item = double({ fake_menu: "Fake Item" })
      error_message = 'Order is already empty'
      expect { subject.remove_item(fake_item) }.to raise_error(error_message)
    end

    it 'removes item from the current order' do
      fake_item = double({ fake_menu: "Fake Item" })
      subject.add_item(fake_item)
      subject.remove_item(fake_item)
      expect(subject.current_order).to be_empty
    end
  end

  describe '#confirm_order' do
    it 'raises error if empty order is confirmed' do
      error_message = 'Unable to confirm an empty order'
      expect { subject.confirm_order }.to raise_error(error_message)
    end

    it 'returns the current order' do
      fake_item = double({ fake_menu: "Fake Item" })
      subject.add_item(fake_item)
      expect(subject.confirm_order).to eq([fake_item])
    end
  end

  describe '#clear_order' do
    it 'clears the order' do
      fake_item = double({ fake_menu: "Fake Item" })
      subject.add_item(fake_item)
      expect(subject.clear_order).to be_empty
    end
  end
end
