require 'menu'

describe Menu do
  describe "#view" do
    it "outputs the menu as a list of dishes and prices" do
      expect{ subject.view }.to output("1. Curry - £10\n2. Pizza - £12\n3. Pasta - £8\n4. Fish - £10\n5. Steak - £18\n").to_stdout
    end
  end

  describe "#price" do
    it "returns price of dish" do
      expect(subject.price("curry")).to eq(10)
    end
  end
end