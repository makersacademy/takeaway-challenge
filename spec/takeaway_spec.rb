require 'takeaway'

describe Takeaway do
  subject {described_class.new}
  takeaway = Takeaway.new

  let(:incorrect_item) { double 'salad' }
  str_double_item = 'chips'
  double_cost = 3
  incorrect_cost = 4
  expect_amount = 3
  #let(:item) {double 'item', :food => 'chips'}
  let(:fake_basket) { double item => min_quantity }

  min_quantity = Takeaway::MIN_QUANTITY



  describe '#see_menu' do
    it 'should return the menu for customer' do
      expect(subject.see_menu).not_to be_empty
    end
  end

  describe '#select' do
    it 'responds to a select method' do
      expect(subject).to respond_to(:select).with(2).arguments
    end
    it 'raises error if item not in menu' do
      expect {subject.select(incorrect_item, min_quantity)}.to raise_error "item not in menu"
    end
    it 'should not raise error if correct item entered' do
      p str_double_item
      expect(subject.select(str_double_item, min_quantity)).to eq min_quantity
    end
  end

  describe '#view_basket' do
    it 'should allow user to see their basket' do
      subject.select(str_double_item, min_quantity)
      expect(subject.view_basket).to eq({str_double_item => min_quantity})
    end
  end

  describe '#place_order' do

    it 'should confirm order by returning the order details' do
        subject.select(str_double_item, min_quantity)
        expect(subject.place_order).to eq 'order placed'

    end

  end

  describe '#total' do
    it 'should return the order total cost' do
      subject.select(str_double_item, min_quantity)
      expect(subject.total_cost).to eq double_cost

  end
end

  describe '#verify' do

    it 'shoudld verify expected amount equals from the order cost' do
      subject.select(str_double_item, min_quantity)
      expect(subject.verify(expect_amount)).to eq true
  end

end
end
