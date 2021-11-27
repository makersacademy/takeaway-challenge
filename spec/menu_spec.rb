require 'menu'

describe Menu do
  let(:menu) { Menu.new }

  describe "#print_available_dishes" do
    it "returns a list of dishes with price" do
      expect { menu.print_available_dishes }.to output(<<-output 
1.Mushroom Risotto: £8
2.Pepperoni Pizza: £4
3.Cheeseburger: £5
4.Prawn Noodles: £8
5.Fries: £3
6.Onion Rings: £3
7.Coca-Cola: £2
8.Ice-cream: £2
      output
      ).to_stdout
    end
  end

  describe "#select_dish" do
    it "adds 2 dishes to the order" do
      expect(menu.select_dish(2,2)).to be 2
    end
  end

  context "order" do
    it "contains the selected dishes" do
      menu.select_dish(2, 1)
      menu.select_dish(6, 1)
      expect(menu.order).to include("Pepperoni Pizza", "Onion Rings")
    end
  end
end
