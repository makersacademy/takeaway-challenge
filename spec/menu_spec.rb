require 'menu'

describe TakeawayMenu do
let(:sms) { double (:sms) }

before do
  allow(subject).to receive(:send_text)
  
end

subject(:takeaway) {described_class.new}
  describe '#initialize' do

    it 'initializes with a menu' do
      expect(subject.menu).not_to eq nil
    end

    it 'initializes with 5 items' do
      expect(subject.menu.count).to eq 5
    end
  end

  describe '#select_dish' do

    it { is_expected.to respond_to(:select_dish).with(1).argument }

    it 'selects 1 dish from menu' do
      expect(subject.select_dish(3)).to eq subject.menu[3]
    end

    it 'selects different dishes from menu' do

    end

  end

  describe '#select_dishes' do
    it { is_expected.to respond_to(:select_dishes) }

    it 'should select a number of dishes' do
      expect(subject.select_dishes([0,1,2,3,4])).to eq [subject.menu[0], subject.menu[1], subject.menu[2], subject.menu[3], subject.menu[4]]
    end
  end

  describe '#total_price' do
    it 'should sum the price of dishes' do
      dishes = subject.select_dishes([1,2,3])
      expect(subject.calculate_price(dishes)).to eq 13.97
    end
  end

  describe '#place_order' do
    it 'should place the order' do
      selected = subject.select_dishes([1,2,3])
      total = subject.calculate_price(selected)
      expect(subject.place_order([1,2,3])).to eq 'Thank you for your order'
    end
  end

end
