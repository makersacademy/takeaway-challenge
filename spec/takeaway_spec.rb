require 'takeaway'

#let (:my_order) {Takeaway.new}

describe Takeaway do
  it 'creating a new instance of takeaway' do
    expect(Takeaway.new).to be_a Takeaway
  end
#see a list of dishes with prices - see = puts, list = an array
  describe '#menu' do
   it { is_expected.to respond_to(:menu).with(1).argument }

   it 'dishes hash exists to be seen' do
      dishes = {
        "Chicken Korma" => 4.50,
        "Veggie Burrito" => 3.00,
        "Fries" => 3.00,
        "Beef Burger" => 7.00,
        "Steak" => 7.00,
        "Kinder Bueno Waffle" => 5.00,
        "Vanilla Ice Cream" => 5.00
      }
      expect(Takeaway.new.menu(dishes)).to include(include("Chicken Korma" => 4.50))
   end
 end
   describe '#dishes_selection' do
     it { is_expected.to respond_to(:dishes_selection).with(1).argument }

     it'putes dishes' do
      expect(Takeaway.new.dishes_selection("Chicken Korma")).to eq("Item: Chicken Korma costs £4.50")
     end

   end



end
