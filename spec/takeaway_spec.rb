require 'Takeaway'
describe Takeaway do

  #Unit Test 1
  describe '#see' do
    it {is_expected.to respond_to(:see).with(1).argument }

    it 'allows us to see menu with prices'do
    takeaway = Takeaway.new
    menu = Menu.new
    menu.add("salad",10)
    expect(takeaway.see(menu)).to eq [{"salad" => 10 }]
    end
  end

  #Unit Test 2
  describe "#select" do
    it 'allows us to select items' do
      takeaway = Takeaway.new
      menu = Menu.new
      menu.add("salad",10)
      menu.add("fish",20)
      takeaway.see(menu)
      takeaway.select("fish")
      expect(takeaway.basket).to eq [{"fish" => 20 }]
    end

    it 'it adds item by number of times specified' do
      takeaway = Takeaway.new
      menu = Menu.new
      menu.add("salad",10)
      menu.add("fish",20)
      takeaway.see(menu)
      takeaway.select("fish",2)
      expect(takeaway.basket).to eq [{"fish"=>20}, {"fish"=>20}]
    end

    # Unit Test 3
    describe '#total' do
      it 'gives me total price of all items ordered' do
        takeaway = Takeaway.new
        menu = Menu.new
        takeaway.see(menu)
        menu.add("salad",10)
        menu.add("water",2)
        takeaway.see(menu)
        takeaway.select("water",2)
        expect(takeaway.total).to eq 4
      end

      it 'compares whether the users amount is correct' do
        takeaway = Takeaway.new
        menu = Menu.new
        takeaway.see(menu)
        menu.add("salad",10)
        menu.add("water",2)
        takeaway.see(menu)
        takeaway.select("water",2)
        takeaway.sum(4)
        expect(takeaway.is_amount_correct).to eq "Thank you! Your order was
        placed and will be delivered before 18:52"

      # If the sum is not correct the method should raise an error,
      # otherwise the customer is sent a text saying that the order was placed
      # successfully and that it will be delivered 1 hour from now,
      #  e.g. "Thank you! Your order was placed and will be delivered before 18:52".

    end 
    end
  end
end
