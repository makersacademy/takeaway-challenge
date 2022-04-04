require_relative '../lib/order'

describe Order do
  let(:menu_double) { double(:menu, list_items: "Korma: £8.50\n" +
                                                "Jalfrezi: £9.00\n" +
                                                "Tikka Masala: £8.00")
  }
  let(:subject) { Order.new(menu_double) }

  context "#creation" do
    it "has an empty order" do
      expect(subject.bill).to eq "\nTotal: £0.00"
    end
  end

  context "#add" do
    it "adds a dish to the items list" do
      subject.add("Korma")
      expect(subject.bill).to eq "Korma: £8.50\nTotal: £8.50"
    end
  end

  context "#bill" do
    it "creates a bill with the total cost of more than one item" do
      subject.add("Korma")
      subject.add("Jalfrezi")
      expect(subject.bill).to eq "Korma: £8.50\n" +
                                 "Jalfrezi: £9.00\n" +
                                 "Total: £17.50"
    end
  end
end
