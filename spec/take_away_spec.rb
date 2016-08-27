require 'take_away'

describe TakeAway do
  subject(:new_order) { described_class.new }
  let(:customer_order) { {"rice"=>2} }
  let(:customer_order2) { {"rice"=>4} }
  let(:price) { "£1.95" }
  let(:dish) { "rice" }
  let(:quantity) { 2 }

  describe 'order_dish' do
    context 'a customer enters a dish correctly' do
      it 'adds a dish to the order' do
      subject.order_dish(dish, quantity)
      expect(subject.order.order).to eq customer_order
      end
    end

   context 'user adds more of the same dish' do
     it 'adds quantity to the existing dish' do
     subject.order_dish(dish, quantity)
     subject.order_dish(dish, quantity)
     expect(subject.order.order).to eq customer_order2
     end
   end
end
  #   context 'a customer enters a dish incorrectly' do
  #     it 'raises an error' do
  #       subject.order_dish("table-tennis", quantity)
  #       badorder = "#{table-tennis.upcase} is not a dish available on the menu, please try again."
  #       expect{subject.order_dish}.to raise_error badorder
  #     end
  #   end
  # end
  #
     describe 'query_price' do
       it 'shows the price of an entered dish' do
         expect(subject.query_price(dish)).to eq price
       end
     end

  # describe 'show_total' do
  #   it 'should check the total of 2 rice is 3.90' do
  #   subject.order_dish(dish, quantity)
  #   expect(subject.is_correct_amount("£3.90")).to eq true
  #   end
  # end
  #
  # describe 'confirm order' do
  #   context 'customer wishes to proceed with order' do
  #     it 'should create an instance of messenger if yes' do
  #     expect(subject.confirm_order('yes')).to eq Messenger.new
  #     end
  #   end
  #
  #   context 'customer does not wish to proceed with order' do
  #     it 'should delete the order' do
  #     expect(subject.confirm_order('no')).to change subject.order.to eq nil
  #     end
  #   end
  # end


end
