require "order"

describe Order do

  let(:takeaway) { Takeaway.new }

  describe "#creates a dish order" do

    it "sets up a new order" do
      expect(subject).to be_an_instance_of(Order)
    end

    it "contains a list to store an item" do
      expect(subject.items).to eq []
    end
  end

  describe "#adds a dish from the menu to the order" do

    it "can add a dish" do
      expect(subject).to respond_to(:add).with(2).argument
    end

    it "fails item not on menu" do
      expect { subject.add("Pad Thai", 1) }.to raise_error "Item not on menu"
    end

    it "adds item to order" do
      subject.add("Chicken Naga", 2)
      expect(subject.items).to include ["Chicken Naga", 7.50, 2]
    end

    it "adds a quantity of item to order" do
      subject.add("Pilau Rice", 3)
      expect(subject.items[0]).to eq ["Pilau Rice", 2, 3]
    end
  end

  describe "#calculates a total of the order placed" do

    before(:example) do
      subject.add("Vegetable Biryani", 2)
      subject.add("Saag Aloo", 1)
    end

    it "returns total amount" do
      expect(subject.print_total).to eq "£15"
    end
  end

  describe "prints the order contents" do

    before(:example) do
      subject.add("Chicken Balti", 1)
      subject.add("Vegetable Biryani", 1)
    end

    it "prints each item and cost on a new line" do
      expect(subject.check).to eq "Total: £12.5"
    end
  end

  describe "submits the order and confimation" do

    it "sends a new text message" do
      expect(subject).to respond_to(:submit)
    end
  end

end
