require 'menu'

describe Menu do
  let(:menu) { Menu.new }

  describe "#initialize" do
    context "creates a list of dishes with prices" do
      it "checks the dish name of the first dish" do
        expect(menu.dishes[0][:dish_name]).to eq "Mushroom Risotto"
      end
      it "checks the price of the second dish" do
        expect(menu.dishes[1][:price]).to eq 4
      end
    end
  end

  describe "#print_available_dishes" do
    it "returns a list of dishes with price" do
      expect { menu.print_available_dishes }.to output(<<-output 
Mushroom Risotto: £8
Pepperoni Pizza: £4
Cheeseburger: £5
Prawn Noodles: £8
Chicken Tikka: £6
      output
      ).to_stdout
    end
  end
end
