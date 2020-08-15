require 'ordersystem'

describe OrderSystem do
  let(:dish) { double :dish }
  let(:option_one) { { dish: dish, price: 3 } }
  let(:option_two) { { dish: dish, price: 5 } }
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
      subject.menu << option_one
      subject.add_to_order dish
      expect(subject.order.count).to eq 1
    end

    it 'only allows menu items to be added' do
      
    end
  end

  describe '#remove_from_order' do
    it { is_expected.to respond_to(:remove_from_order).with(2).argument }

    it 'decreases order count' do
      subject.order << option_one
      subject.remove_from_order dish
      expect(subject.order).to be_empty
    end

    it 'raises an error if already empty' do
      expect { subject.remove_from_order dish }.to raise_error "The order is currently empty"
    end

    it 'raises an error if it doesnt exist' do
      subject.order << option_one
      expect { subject.remove_from_order "fake_dish" }.to raise_error "This isn't on the order"
    end
  end

  describe '#view_order' do
    it { is_expected.to respond_to :view_order }

    it 'shows the correct summary' do
      subject.order << { dish: dish, price: 3, quantity: 1 }
      subject.order << { dish: dish, price: 5, quantity: 1 }
      expect { subject.view_order }.to output("#{dish} x 1 = £3\n#{dish} x 1 = £5\n").to_stdout
      
    end
  end

  describe '#view_total' do
    it { is_expected.to respond_to :view_total }

    it 'returns the correct total' do
      subject.order << option_one
      subject.order << option_two
      expect(subject.view_total).to eq 8
    end
  end

  describe '#place_order' do
    it { is_expected.to respond_to :place_order }
  end
end
