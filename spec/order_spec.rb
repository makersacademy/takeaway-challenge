require 'order'

describe Order do

  let(:dish) { double :dish, show_details: 'Pizza: £2.00', price: 2.00, name: 'Pizza' }
  let(:dish2) {double :dish2, show_details: 'Burger: £1.50', price: 1.50, name: 'Burger'}
  it { is_expected.to respond_to :order }

  describe '#add_to_order' do
    it { is_expected.to respond_to :add_to_order}

    it 'should add dish to order' do
      subject.add_to_order dish, 1
      subject.add_to_order dish2, 1
      expect(subject.order).to eql [dish, dish2]
    end
  end

  describe '#place_order' do
    it {is_expected.to respond_to :place_order}

    it 'should show order and total price' do
      subject.add_to_order dish, 2
      subject.add_to_order dish2, 1
      expect{subject.place_order}.to output("Your order:\nPizza: £2.00 X2\nBurger: £1.50 X1\nTotal: £5.50\n").to_stdout{:Pizza}
    end
  end

end
