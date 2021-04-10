require 'takeaway'

describe Takeaway do

let (:items) { double :items }
let (:subject) { Takeaway.new }
  
  context "View items" do 
    it 'Displays the dishes along with prices' do
      expect(subject.items).to eq({margarita: 8.99, vegetarian: 9.99, pepperoni: 10.99, cheesecake: 3.99, water: 0.99})
    end
    it 'Has an item that has a price for the user to select' do
      expect(subject.items[:margarita]).to be > 0
    end

  context "Select items" do
    it 'Allows the user to use the add command' do
      expect(subject).to respond_to(:add)
    end
    it 'Has an empty shopping cart by default' do
      expect(subject.shoppingcart).to eq([])
    end
    it 'Checks that an item can be added to the shopping cart' do
      subject.add()
    end
  end
end
end
