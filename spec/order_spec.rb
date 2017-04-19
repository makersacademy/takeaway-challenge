require 'order'

describe Order do
  subject(:order) { described_class.new('cake',2)}

  describe 'responds to' do
    it {is_expected.to respond_to(:add).with(2).arguments}
    it {is_expected.to respond_to(:place)}
    it {is_expected.to respond_to(:confirm)}
    it {is_expected.to respond_to(:deduct)}
  end

  it "accepts an item from the menu and a quantity" do
    expect{Order.new('cake', 4)}.not_to raise_error
  end
  context 'when no quantity is inputted' do
    it 'should assume a default input of 1' do
      expect{Order.new('chips')}.to_not raise_error
    end
  end
  context 'when an unknown item is ordered' do
    it 'raises an error' do
      expect{Order.new('matress', 4)}.to raise_error 'unknown item inputted, please enter an item on the menu'
    end
  end

  describe '#add' do
    it "adds a new item to the order" do
      order.add('oreo',1)
      expect(order.view).to include('oreo' => 1)
    end
    it "increases the quantity of an existing item" do
      expect{order.add('cake',2)}.to change{order.view['cake']}.by(2)
    end
  end

  describe '#deduct' do
    it 'deducts from the order' do
      expect{order.deduct('cake',1)}.to change{order.view['cake']}.by(-1)
    end
    context "when trying to deduct an unordered item" do
      it 'returns an error' do
        expect{order.deduct('oreo')}.to raise_error "You have not yet ordered any oreo"
      end
    end
  end
end
