require 'order'

describe Order do
  let(:menu) { double(:menu, :number => 1, :search_menu_items => 1) }
  describe "contains" do
    it "a list of all the items for the order" do
      expect(subject.order_list).to be_a(Array)
    end
    it "stores a variable for the order total" do
      expect(subject.order_total).to be_a(Integer)
    end
  end

  describe "add_to_order" do
    it "allows the user to enter multiple dishes to their order." do
      allow($stdout).to receive(:write)
      allow($stdin).to receive(:gets).and_return("1", "y", "y")
      expect(subject.add_to_order(menu)).to be_a(Array)
    end
  end

  describe "order_entry" do
    before do
      allow($stdout).to receive(:write)
    end
    it "should capture the customers order" do
      allow($stdin).to receive(:gets).and_return("1", "y")
      expect(subject.order_entry(menu)).to eq(1)
    end
    it "should allow the customer to change the dish if incorrect" do
      allow($stdin).to receive(:gets).and_return("2", "n", "1", "Y")
      expect(subject.order_entry(menu)).to eq(1)
    end
  end  

  describe "input_check" do
    it "when the input is a string return downcase of that string" do
      expect(subject.input_check("WoRd")).to eq("Word")
    end
    it "when the input is a number in a string return the int of that number" do
      expect(subject.input_check("10")).to eq(10)
    end
  end
end
