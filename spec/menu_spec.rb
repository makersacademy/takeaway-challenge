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


  describe '#place_order' do
    it 'should place the order' do
      selected = subject.select_dishes([1,2,3])
      total = subject.calculate_price(selected)
      expect(subject.place_order([1,2,3])).to eq 'Thank you for your order'
    end
  end

end
