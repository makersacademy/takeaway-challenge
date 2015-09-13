require 'restaurant'
describe Restaurant do

  describe '#order' do
    it 'should respond to order' do
      is_expected.to respond_to(:order)
    end
    it 'should raise and error if item not on the menu' do
      expect{ subject.make_order(:carrots, 1) }.to raise_error "Cannot order items not on the menu"
    end
    it 'should add items to order' do
      expect(subject.make_order(:pizza, 1)).to eq(1)
    end
  end
  describe '#review' do
    it 'should return the items and quantity order' do
      subject.make_order(:pizza, 2)
      expect(subject.review).to eq("order = pizza: 2")
    end
  end
  describe '#total' do
    it "should add up the total amount of the order" do
      subject.make_order(:pizza, 2)
      expect(subject.total).to eq(11.98)
    end
  end
  describe '#reciept' do
    it 'should respond to reciept' do
      is_expected.to respond_to(:reciept)
    end
    it 'should show customer total cost' do
      subject.make_order(:pizza, 2)
      expect(subject.reciept).to eq("Total cost: £11.98")
    end
  end
end
