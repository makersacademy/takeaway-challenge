require 'takeaway'

#let (:my_order) {Takeaway.new}

describe Takeaway do
  it 'creating a new instance of takeaway' do
    expect(Takeaway.new).to be_a Takeaway
  end
#see a list of dishes with prices - see = puts, list = an array
 it 'dishes hash exists to be seen' do
    dishes = [
      4.50 => ["Chicken Korma","Chicken Katsu Curry"],
      3.00 => ["Veggie Burrito","Fries"],
      7.00 => ["Beef Burger", "Steak"],
      5.00 => ["Kinder Bueno Waffle", "Vanilla Ice Cream"]
    ]
    expect(Takeaway.new.dishes).to include(include(4.50 => ["Chicken Korma","Chicken Katsu Curry"]))
 end

 it'putes dishes' do
   suject.dishes_selection(mydish)
  expect(Takeaway.new.dishes_selection "Chicken Korma").to satisfy {"Item: #{value} costs £#{key}"}
 end

end
