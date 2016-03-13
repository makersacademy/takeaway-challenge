require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new(order_class) }
  let(:order) {double :order}
  let(:order_class) {double :order_class, new: order}
  let(:menu) {double :menu }

  before do
    allow(order).to receive(:add_to_basket)
    allow(order).to receive(:total)
  end

  it 'should respond to list_menu method' do
    expect(takeaway).to respond_to :list_menu
  end

  it 'should respond to order method' do
    expect(takeaway).to respond_to(:order).with(2).arguments
  end

  describe '#initialize' do
    it 'should initialize with a menu hash' do
      expect(takeaway.menu).to be_a Hash
    end
  end

  describe '#list_menu' do
    it 'should list the food items and prices' do
      allow(takeaway).to receive(:list_menu).and_return menu
      expect(takeaway.list_menu).to eq menu
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
