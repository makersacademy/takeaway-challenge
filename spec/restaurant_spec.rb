require 'restaurant'
describe Restaurant do
subject { Restaurant.new(Menu, pizza: 5.99, burger: 4.99, chip: 2.99, sandwich: 3.99)}


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
    before do
    Timecop.freeze(Time.local(2015)).strftime("%H:%M")
    end

    after do
    Timecop.return
    end

    it 'should respond to receipt' do
      is_expected.to respond_to(:receipt)
    end
    it 'should show customer total cost' do
      subject.make_order(:pizza, 2)
      expect(subject.receipt).to eq("Thank you! Total cost: £11.98 - pizza: £11.98 it should arrive before 01:00")
    end
  end
  describe '#reset_order'
    it 'allows you to reset your order' do
      subject.make_order(:pizza, 2)
      subject.reset_order
      expect(subject.order.empty?).to be true
    end
end
