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



end
