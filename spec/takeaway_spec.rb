require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new(order_class, checkout_class) }
  let(:order) {double :order}
  let(:checkout) {double :checkout}
  let(:order_class) {double :order_class, new: order}
  let(:checkout_class) {double :checkout_class, new: checkout}
  let(:menu) {double :menu }

  before do
    allow(order).to receive(:add_to_basket)
    allow(order).to receive(:total)
  end

  describe '#display_menu' do
    it 'should list the food items and prices' do
      allow(takeaway).to receive(:display_menu).and_return menu
      expect(takeaway.display_menu).to eq menu
    end
  end

  describe '#order' do
    it 'should raise error message if item inputted is not in menu' do
      message = 'Item not in menu'
      expect{takeaway.order(menu)}.to raise_error message
    end

    it 'should reset selection to an empty hash' do
      takeaway.order("cheese pizza")
      expect(takeaway.selection).to be_empty
    end
  end

  describe '#checkout' do
    it 'should raise and error message if payment does not match order total' do
      message = "Incorrect payment amount"
      takeaway.order("fish and chips", 2)
      expect{takeaway.checkout(5)}.to raise_error message
    end
  end
end
