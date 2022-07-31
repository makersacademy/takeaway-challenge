require "menu"

describe Menu do
  describe "#to_s" do
    it "shows the entire menu" do
      expect(subject.to_s).to eq(
        "Pizza Takeaway\n" +
        "===============================\n" +
        "1. Margherita - £10.00\n" +
        "2. Diavola - £11.00\n" +
        "3. Boscaiola - £14.00\n" +
        "4. Quattro Stagioni - £13.00\n" +
        "5. Capricciosa - £12.00\n" +
        "6. Marinara - £9.00\n" +
        "===============================\n"
      )
    end
  end

  describe "#select" do
    it "returns the corresponding menu item" do
      item = subject.select(3)
      expect(item.price).to eq(14)
      expect(item.name).to eq("Boscaiola")
    end
  end
end
