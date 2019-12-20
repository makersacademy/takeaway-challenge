require 'takeaway'

let (:my_order) {Takeaway.new}

describe Takeaway do
  it 'creating a new instance of takeaway' do
    expect(my_order).to be_a Takeaway
  end
#see a list of dishes with prices - see = puts, list = an array
 it 'putes dishes' do
    dishes = [
      4.50 => ["Chicken Korma","Chicken Katsu Curry"],
      3.00 => ["Veggie Burrito","Fries"],
      7.00 => ["Beef Burger", "Steak"],
      5.00 => ["Kinder Bueno Waffle", "Vanilla Ice Cream"]
    ]
    expect(my_order.dishes).to include(include(4.50 => ["Chicken Korma","Chicken Katsu Curry"]))
 end

end
