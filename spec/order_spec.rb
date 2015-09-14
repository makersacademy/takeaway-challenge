require 'order'

describe Order do

  let(:dish) { double :dish, show_details: 'Pizza: £2.00', price: 2.00}
  let(:dish2) {double :dish2, show_details: 'Burger: £1.50', price: 1.50}
  it { is_expected.to respond_to :order }

  describe '#add_to_order' do
    it { is_expected.to respond_to :add_to_order }

    it 'should add dish to order' do
      subject.add_to_order(dish, 1)
      subject.add_to_order(dish2, 1)
      expect(subject.order).to eql [dish, dish2]
    end
  end

  describe '#show_order' do
    it {is_expected.to respond_to :show_order }

    it 'should show order' do
      subject.add_to_order(dish, 3)
      expect{subject.show_order}.to output("Pizza: £2.00 X3\n").to_stdout
    end
  end

  describe '#total_price' do
    it 'should show the total price' do
      subject.add_to_order(dish, 3)
      expect(subject.total_price).to be 6.0
    end
  end

  describe '#place_order' do
    it { is_expected.to respond_to :place_order }

    it 'should raise error when payment doesn not match total' do
      subject.add_to_order(dish, 3)
      expect{subject.place_order(3)}.to raise_error"Payment doesn't match total!"
    end
  end

end
