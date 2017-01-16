require 'takeaway'

describe Takeaway do

  let(:list){double :list, dish_list: ({"Burger" => 5})}
  subject(:takeaway) {described_class.new(list)}
  let(:dish) {double :dish}
  let(:price) {double :price}
  let(:quantity) {double :quantity}
  let(:false_dish) {double :false_dish}
  let(:twil_num) {double :twil_num}
  let(:phone_num) {double :phone_num}

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
      takeaway.order_meal("Burger",3)
      expect(takeaway.user_order).to eq({"Burger" => [3, 5]})
    end

     it 'should raise an error if the order is not in the list' do
       expect{takeaway.order_meal(false_dish, quantity)}.to raise_error("Item not in list")
     end
  end

  describe '#show_price' do
    it 'should show a total price for the order' do
       expect(takeaway).to respond_to(:show_price)
       takeaway.order_meal("Burger",2)
       takeaway.show_price
       expect(takeaway.total_price).to eq 10
    end
    it 'should print an itemised price list for the order' do
      expect(takeaway).to respond_to(:show_order_list)
    end
  end

   describe '#show_order_list' do
     it 'should print an itemised order list' do
       takeaway.order_meal("Burger",2)
       takeaway.show_price
       expect(takeaway.show_order_list).to eq "Total: 10"
     end
  end

  describe '#send_message' do
    it 'should send a confirmation text' do
      allow(takeaway).to receive(:send_message).and_return true
      expect(takeaway.send_message(twil_num, phone_num)).to eq true
    end
  end

end
