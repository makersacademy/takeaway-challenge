require 'order'

describe Order do

   subject(:order) { described_class.new }
   let(:order1) { {"rice"=>2} }
   let(:order2) {  "You currently have in your basket:\n 2x rice @ £1.95 = £3.9" }
   let(:price) { "£1.95" }
   let(:dish) { "rice" }
   let(:quantity) { 2 }

 describe 'add' do
   it 'adds one dish to the order' do
   subject.add(dish, quantity)
   expect(subject.order).to eq order1
   end
 end

 describe 'calculate_total' do
   context '2x rice @1.95 have been ordered' do
     it 'returns 3.90 as the total' do
     subject.add(dish, quantity)
     expect(subject.calculate_total).to eq "£3.90"
     end
    end
 end

# describe 'show_order' do
#   context '2x rice @1.95 have been ordered' do
#   it 'shows quantity, dish and total price for dishes' do
#   subject.add(dish, quantity)
#   expect(subject.show_order).to output(order2).to_stdout
#   end
#   end
# end


  describe 'order_exists' do
    context 'an order has been placed' do
      it 'should return true' do
      subject.add(:dish, :quantity)
      expect(subject.order_exists?).to eq true
      end
    end
  end

  describe 'delete_order' do
    it 'should make the order nil' do
    subject.delete_order
    expect(subject.order).to eq nil
    end
  end


end
