require 'takeaway'

describe Takeaway do
  subject {described_class.new}
  takeaway = Takeaway.new

  let(:incorrect_item) { double 'salad' }
  str_double_item = 'chips'     #let(:item) {double 'item', :food => 'chips'}
  double_cost = 3
  incorrect_cost = 4
  expect_amount = 3
  let(:fake_basket) { double item => min_quantity }
  let(:menu) {double 'menu'}

  min_quantity = Takeaway::MIN_QUANTITY


  describe '#select' do
    it 'responds to a select method' do
      expect(subject).to respond_to(:select).with(2).arguments
    end
    it 'raises error if item not in menu' do
      allow(menu).to receive(:has?) {false}
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
      expect(subject.view_basket).to eq("Total: #{double_cost}")
    end
  end


  describe '#total' do
    it 'should return the order total cost' do
      subject.select(str_double_item, min_quantity)
      expect(subject.total_cost).to eq double_cost

  end
end

  describe '#verify' do

    it 'shoudld enable customer to enter expected amount' do
      expect(subject.verify(expect_amount)).to eq expect_amount
  end

end

describe '#equal?' do
  it 'should check whether the total cost matches the customers expected bill' do
    subject.select(str_double_item, min_quantity)
    subject.verify(expect_amount)
    expect(subject.equal?).to eq true
  end
end

  describe '#place_order' do

    it 'should raise error if expected amount does not equal order total' do
      subject.select(str_double_item, min_quantity)
      subject.verify(incorrect_cost)
      expect { subject.place_order }.to raise_error "your order does not equal your expected amount"
    end


  end
end





# it 'should confirm order by returning the order details' do
#     subject.select(str_double_item, min_quantity)
#     expect(subject.place_order).to eq 'order placed'
#
# end
