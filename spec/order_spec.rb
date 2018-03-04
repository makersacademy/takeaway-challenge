require 'order'

describe Order do
  let(:fake_verify_class) { double 'fake_verify_class' }
  subject(:subject) { described_class.new(fake_verify_class) }

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

  describe '#confirm_order' do
    it 'Should call the verify_order method on Verify class' do
      expect(fake_verify_class).to receive(:verify_order)
      subject.confirm_order
    end
  end
end
