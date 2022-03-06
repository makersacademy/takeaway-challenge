require 'menu'

describe Menu do

  let(:dish) { double(:dish, name: "Large Chips", price: 2.99)}
  let(:another_dish) { double(:dish, name: "Large Cod", price: 5)}

  describe "#add" do
    it "adds the item to the menu" do
      subject.add(dish)
      expect { subject.display }.to output("1. Large Chips - £2.99\n").to_stdout
    end
  end
  describe "#delete" do
    it "deletes the item from the menu" do
      subject.add(dish)
      subject.delete(1)
      expect { subject.display }.to raise_error("No menu available")
    end
    it "only accepts the dish number as input" do
      subject.add(dish)
      expect { subject.delete("Large Chips") }.to raise_error("Please enter the dish number")
    end
    it "raises error if dish number does not exist" do
      subject.add(dish)
      expect { subject.delete(2) }.to raise_error("This dish does not exist")
    end
  end
  describe "#display" do
    it "puts each menu item into the terminal" do
      expected_output = "1. Large Chips - £2.99\n2. Large Cod - £5.00\n"
      subject.add(dish)
      subject.add(another_dish)
      expect { subject.display }.to output(expected_output).to_stdout
    end
    it "raises error if menu is empty" do
      expect { subject.display }.to raise_error("No menu available")
    end
  end
end