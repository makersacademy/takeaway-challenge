require 'restaurant'
describe Restaurant do
subject { Restaurant.new(Menu)}
  describe '#make_order' do
    it 'should respond to order' do
      is_expected.to respond_to(:make_order)
    end
    it 'should raise and error if item not on the menu' do
      expect{ subject.make_order(:carrots, 1) }.to raise_error "Cannot order items not on the menu"
    end
    it 'should add items to order' do
      expect(subject.make_order(:pizza, 1)).to eq("1 x pizza has been added to your order")
    end
  end
  describe '#review' do
    it 'should return the items and quantity order' do
      subject.make_order(:pizza, 2)
      expect(subject.review).to eq("pizza: 2")
    end
  end
  describe '#reciept' do
    it 'should respond to reciept' do
      is_expected.to respond_to(:reciept)
    end
    it 'should show customer total cost' do
      subject.make_order(:pizza, 2)
      expect(subject.reciept).to eq("Total cost: £11.98\n - pizza: £11.98")
    end
  end
end
