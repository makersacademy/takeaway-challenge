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
      expect { subject.add(:pad_thai,1) }.to raise_error "Item not on menu"
    end

    it "adds item to order" do
      subject.add(:chicken_naga,2)
      expect(subject.items).to include [:chicken_naga,2]
    end

    it "adds a quantity of item to order" do
      subject.add(:pilau_rice, 3)
      expect(subject.items[0]).to eq [:pilau_rice, 3]
    end
  end

  describe "#calculates a total of the order placed" do

    it "checks that total exists" do
      expect(subject).to respond_to(:total)
    end

    before(:example) do
      subject.add(:vegetable_biryani, 1)
    end

    it "finds the item value" do
      name = subject.items[0][0]
      expect(subject.menu[name]).to eq 6
    end

    it "adds the total of an item" do
    end

  end
end
