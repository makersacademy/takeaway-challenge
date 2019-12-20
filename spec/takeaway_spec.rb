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
        takeaway.select("water",2)
        expect(menu.total).to eq 4
      end
    end
  end
end
