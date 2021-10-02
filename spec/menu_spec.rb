require 'menu'

describe Menu do

  it { is_expected.to respond_to(:dishes) }

  let(:menu) { Menu.new }
  let(:dish1) { double(:dish, name: "Chicken Tikka", price: 5.00 ) }
  let(:dish2) { double(:dish, name: "Jalfrezi", price: 6.00 ) }

  context "Adding then printing" do

    it "should return list of dishes and prices each on new line" do
      menu.add(dish1)
      menu.add(dish2) 
      expect(menu.print).to eq "Chicken Tikka: £5.0 \nJalfrezi: £6.0" # needs to show two zeros.
    end

  end

  
  describe "#release" do

    it "should return a dish from the menu " do
      menu.add(dish1)
      menu.add(dish2)
      
      expect(menu.release("Chicken Tikka", 1)).to eq [dish1] # Could be testing implemntation state here
      expect(menu.release("Chicken Tikka", 2)).to eq [dish1, dish1] # another way?
      expect(menu.release("Jalfrezi", 1)).to eq [dish2]
    end

    it "should raise error if dish not on menu" do
      expect { menu.release("Margharita", 1) }.to raise_error "Not on Menu" 
    end
    

  end


end