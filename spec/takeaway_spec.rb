require 'takeaway'

describe Takeaway do

  let(:list){double :list, dish_list: ({dish => price})}
  subject(:takeaway) {described_class.new(list)}
  let(:dish) {double :dish}
  let(:price) {double :price}
  let(:quantity) {double :quantity}
  let(:false_dish) {double :false_dish}

  describe '#show_list' do
    it 'should show a list of dishes' do
    #  expect(takeaway).to respond_to(:show_list).with(1).argument
    expect(takeaway.show_list).to eq list.dish_list
    end
  end

  describe '#order_meal' do
    it 'should allow the user to order a meal' do
      expect(takeaway).to respond_to(:order_meal).with(2).arguments
    end
    it 'should add dish the user order with the number of each dish added' do
    #  allow(takeaway).to receive(:quantity).and_return(2)
      takeaway.order_meal(dish,quantity)
      expect(takeaway.user_order).to eq({dish => quantity})
    end

     it 'should raise an error if the order is not in the list' do
       expect{takeaway.order_meal(false_dish, quantity)}.to raise_error("Item not in list")
     end
  end

end
