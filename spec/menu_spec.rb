require 'menu'

describe Menu do
  let(:menu) { Menu.new }

  describe "#print_available_dishes" do
    it "returns a list of dishes with price" do
      expect { menu.print_available_dishes }.to output(<<-output 
Mushroom Risotto: £8
Pepperoni Pizza: £4
Cheeseburger: £5
Prawn Noodles: £8
Fries: £3
Onion Rings: £3
Coca-Cola: £2
Ice-cream: £2
      output
      ).to_stdout
    end
  end
end
