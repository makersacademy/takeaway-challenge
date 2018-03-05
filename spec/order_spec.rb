require 'order'

describe Order do
  let(:fake_verify_class) { double 'fake_verify_class' }
  subject(:subject) { described_class.new(fake_verify_class) }

  it 'Should initialize with an empty current_order' do
    expect(subject.current_order).to eq []
  end

  describe '#order_item' do
    it 'Should add item as hash to current order' do
      subject.order_item({ i: "", price: 1 })
      expect(subject.current_order).to eq([{ i: "", price: 1 }])
    end

    it 'Should add the price of item to order_price' do
      item = { i: "", price: 1 }
      subject.order_item(item)
      expect(subject.order_price).to eq 1
    end
  end

  describe '#remove_item' do
    it 'Should subtract the price of item from order price' do
      item = { i: "test", price: 1 }
      subject.order_item(item)
      subject.remove_item(item)
      expect(subject.order_price).to eq 0
    end

    it 'Should delete item from current order' do
      subject.order_item({ i: "", price: 1 })
      subject.remove_item({ i: "", price: 1 })
      expect(subject.current_order).to eq []
    end
  end

  describe '#confirm_order' do
    it 'Should call the verify_order method on Verify class' do
      expect(fake_verify_class).to receive(:verify_order)
      subject.confirm_order
    end
  end
end
