require 'ordersystem'

describe OrderSystem do
  let(:dish) { double :dish }
  let(:price) { double :price }
  let(:item) { { dish: dish, price: 1 } }
  let(:takeaway) { TakeawayKitchen.new.menu }
  
  it 'returns the menu from TakeawayKitchen' do
    expect(subject.menu).to eq takeaway
  end

  it 'initializes with an empty order' do
    expect(subject.order).to be_empty
  end

  describe '#view_menu' do
    it 'returns a hash' do
      expect(subject.view_menu).to include({ dish: be_an(String), price: be_an(Integer) })
    end
  end

  describe '#add_to_order' do
    it { is_expected.to respond_to(:add_to_order).with(2).argument }

    it 'increases order count' do
      subject.menu << item
      subject.add_to_order dish
      expect(subject.order.count).to eq 1
    end
  end

  describe '#remove_from_order' do
    it { is_expected.to rspond_to(:remove_from_order).with(2).argument }

    it 'decreases order count' do
      subject.menu << item
      subject.remove_from_order dish
      expect(subject.order).to be_empty
    end

    it 'raises an error if already empty' do
      expect { subject.remove_from_order dish }.to raise_error "The order is already empty"
    end

    it 'raises an error if it doesnt exist' do
      subject.menu << item
      expect { subject.remove_from_order "fake_dish" }.to raise_error "This isn't on the order"
    end
  end

  describe '#view_order' do
    it { is_expected.to respond_to :view_order }
  end

  describe '#checkout' do
    it { is_expected.to respond_to :checkout}
  end

  describe '#place_order' do
    it { is_expected.to respond_to :place_order}
  end
end
