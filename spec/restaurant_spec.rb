require 'restaurant'

describe Restaurant do

  let(:dishes_class) {double :dishes_class, new: test_dishes}
  let(:test_dishes) {double :test_dishes, dishes: {
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

  describe "#avilable_dishes" do

    it 'should get a list of avilable_dishes' do
      expect(subject.available_dishes).to eq test_dishes.dishes
    end

  end

  describe "#place_order" do

    it 'should raise an error if total does not match correct sum of dishes' do

    end

    it 'should create new Order object and send it the selected dishes' do
      # except(order).to have_received(new_order).with(dishes)
    end

    it 'should create new Message object and send it a confirm instruction' do

    end

  end

end
