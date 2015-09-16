require 'order'

describe Order do
  let(:menu) {double :menu, dishes: [dish, dish2] }
  let(:dish) { double :dish, show_details: 'Pizza: £2.00', price: 2.00}
  let(:dish2) {double :dish2, show_details: 'Burger: £1.50', price: 1.50}
  let(:dish3) {double :dish3}
  it { is_expected.to respond_to :order }

  describe '#add_to_order' do

    it { is_expected.to respond_to :add_to_order }

    it 'should add dish to order' do
      subject.add_to_order(menu, dish, 1)
      subject.add_to_order(menu, dish2, 1)
      expect(subject.order).to eql [dish, dish2]
    end

    it 'should raise error if dish is not on menu' do
      expect{subject.add_to_order(menu, dish3, 1)}.to raise_error(
        'Item not on menu')
    end
  end

  describe '#show_order' do

    it {is_expected.to respond_to :show_order }

    it 'should show order' do
      subject.add_to_order(menu, dish, 3)
      expect(subject.show_order).to eql "\nPizza: £2.00 X3"
    end
  end

  describe '#total_price' do

    it { is_expected.to respond_to :total_price }

    it 'should show the total price' do
      subject.add_to_order(menu, dish, 3)
      expect(subject.total_price).to be 6.0
    end
  end

  describe '#place_order' do

    it { is_expected.to respond_to :place_order }

    it 'should raise error when payment doesn not match total' do
      subject.add_to_order(menu, dish, 3)
      expect{subject.place_order(3)}.to raise_error "Incorrect Payment"
    end

    it 'should send text when payment is authorised' do
      subject.add_to_order(menu, dish, 3)
      expect(subject.place_order(6)).to eql 'text sent'
    end
  end
end
