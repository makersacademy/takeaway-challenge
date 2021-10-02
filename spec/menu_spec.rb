require 'menu'

describe Menu do

  it { is_expected.to respond_to(:dishes) }

  let(:menu) { Menu.new }
  let(:dish1) { double(:dish, name: "Chicken Tikka", price: 5.00 ) }
  let(:dish2) { double(:dish, name: "Jalfrezi", price: 6.00 ) }

  describe "#print" do

    it "should return list of dishes and prices each on new line" do
      menu.add(dish1)
      puts "SEE BELOW"
      puts dish1.price
      menu.add(dish2) 
      expect(menu.print).to eq "Chicken Tikka: £5.0 \nJalfrezi: £6.0" # needs to show two zeros.
    end

  end

  describe "#add" do

    it "should add a dish and be viewable from print" do
      
    end
  end
  
  describe "#release" do

    it "should return a dish from the menu " do
      
    end

  end


end