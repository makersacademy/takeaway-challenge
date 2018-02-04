require 'menu'

describe Menu do
  describe "#menu_list" do
    it "is an array of items" do
      expect(subject.menu_list).to be_an Array
    end
  end

  describe "#print" do
    it "prints out the menu items and prices" do
      expect { subject.print }.to output("1 Chips £1.00\n2 Burger £3.50\n3 Coke £0.80\n").to_stdout
    end
  end
end
