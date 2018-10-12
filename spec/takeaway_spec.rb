require 'takeaway'

describe Takeaway do

  it 'should show dishes and prices' do
    expect(subject.show_menu).to eq([{dish: "burger", price: 4},
      {dish: "cheeseburger", price: 5},
      {dish: "chicken burger", price: 4.5},
      {dish: "chips", price: 2},
      {dish: "cheesy chips", price: 2.5},
      {dish: "onion rings", price: 2},
      {dish: "mozarella sticks", price: 2},
      {dish: "garlic bread", price: 3},
      {dish: "cheesy garlic bread", price: 3.5}])
    end

end
