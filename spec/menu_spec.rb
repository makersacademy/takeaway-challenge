require "menu" 

describe Menu do
  
  describe "#check_menu" do
    it "returns a list of dishes" do
      expect { subject.check_menu }.to output("Menu:\n1. Chicken - £10\n2. Steak - £15\n3. Pasta - £8\n4. Pizza - £9\n").to_stdout
    end
  end

  describe "#get_price" do
    it "should return 10 as the price of a chicken dish" do
      expect(subject.get_price("Chicken")).to eq(10)
    end
  end

end
