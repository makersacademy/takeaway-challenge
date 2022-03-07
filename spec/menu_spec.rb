require 'menu'

describe Menu do

  let(:dish) { double(:dish, name: "Large Chips", price: 2.99)}
  let(:another_dish) { double(:dish, name: "Large Cod", price: 5)}

  describe "#display" do
    it "puts each menu item into the terminal" do
      expected_output = "Menu
1. Large Cod - £4.99
2. Large Haddock - £5.99
3. Jumbo Sausage - £3.29
4. Deep Fried Mars Bar - £1.99
5. Small Chips - £2.49
6. Large Chips - £3.39
7. Steak and Kidney Pie - £4.00
8. Mushy Peas - £0.99
End Menu"
      expect { subject.display }.to output(expected_output).to_stdout
    end
  end
end