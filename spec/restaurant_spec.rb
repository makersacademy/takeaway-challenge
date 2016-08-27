require 'restaurant'

describe Restaurant do

  subject(:restaurant) { described_class.new(dishes_class.new, dispatcher_class.new) }
  let(:dishes_class) {double :dishes_class, new: test_dishes}
  let(:dispatcher_class) {double :dispatcher_class, new: dispatcher}

  let(:test_dishes) {double :test_dishes, check_sum: true, dishes: {
    chicken: { name: "Rotisserie chicken",
      price: 15,
      quantity: 10
    },
    spinach: {
      name: "Wilted spinach",
      price: 3,
      quantity: 80
    }, potatoes: {
      name: "Roasted potatoes",
      price: 5,
      quantity: 50
    }
  }}
  let(:order2) {double :order2, status: "Confirmed"}
  let (:dispatcher) {double :dispatcher, current_order: nil, create_new_order: nil}

  describe "#avilable_dishes" do

    it 'should get a list of avilable_dishes' do
      expect(restaurant.available_dishes).to eq test_dishes.dishes
    end

  end

  context "when an order is ready to go" do

    describe "#place_order" do

      it 'should send an start_order message to the Order object' do
        restaurant.place_order
        expect(dispatcher).to have_received(create_new_order).with(2).arguments
      end
    end

    describe '#confirm_order' do

      it 'should send an order to Message to text a confirmation' do

      end

      it 'should set the Order status to confirmed' do
        restaurant.confirm_order
        expect(order2.status).to eq "Confirmed"
      end
    end
  end

  context "when an order is wrong" do
    describe "#confirm_order" do

      before(:each) do
        @list = [[:chicken,1],[:spinach,3],[:potatoes,2]]
        @sum = 25
      end

      xit 'should raise an error if total does not match correct sum of dishes' do
        expect{restaurant.confirm_order}.to raise_error "Wrong total!"
      end

    end
  end

end
