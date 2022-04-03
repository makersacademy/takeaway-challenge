require_relative '../lib/order'

describe Order do
  let(:menu_double) { double(:menu, list_items: "Korma: £8.50\n" +
                                                "Jalfrezi: £9.00\n" +
                                                "Tikka Masala: £8.00")
  }

  context "#creation" do
    it "has an empty order" do
      expect(subject.list).to eq ""
    end
  end

  context "#add" do
    it "adds a dish to the items list" do
      subject.add("Korma")
      expect(subject.list).to eq "Korma: £8.50"
    end
  end

  context "#bill" do
    it "creates a bill with the total cost" do
      subject.add("Korma")
      subject.add("Jalfrezi")
      expect(subject.bill).to eq "Korma: £8.50\n" +
                                 "Jalfrezi: £9.00\n" +
                                 "Total: £17.50"
    end
  end
end
