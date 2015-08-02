require 'takeaway'

describe Takeaway do
  it "has initialized list of dishes with prices" do
    hash = { "chicken" => 4, "lamb" => 7, "vegetables" => 3, "iced latte" => 2 }
    expect(subject.list).to eq hash
  end

  describe "#see_list" do
    it "should return an array of all the dishes" do
      list = { "chicken" => 4, "lamb" => 7, "vegetables" => 3, "iced latte" => 2 }
      expect(subject.see_list).to eq list.keys
    end
  end

  describe "#place_order" do
    it "should return total costs of order" do
      expect(subject).to receive(:total)
      subject.place_order("chicken", 2)
    end
  end

  describe "#total" do
    it "should return total costs of customer" do
      allow(subject).to receive(:all_costs) { 10 }
      subject.place_order("chicken", 2)
      expect(subject.total(8)).to eq 18
    end
  end

  describe "#exact_sum" do
    it "should return exact sum of orders" do
      subject.place_order("chicken", 2)
      subject.place_order("lamb", 2)
      expect(subject.exact_sum).to eq 22
    end
  end

  describe "#check" do
    it "should raise error if exact sum is not equal to total costs" do
      subject.place_order("chicken", 2)
      subject.all_costs = 50
      expect { subject.check }.to raise_error "Your order costs is incorrect"
    end

    it "should call the method successful when true" do
      subject.place_order("chicken", 2)
      subject.all_costs = 8
      expect(subject).to receive(:successful)
      subject.check
    end
  end

  describe "#successful" do
    it "should respond to successful" do
      expect(subject).to respond_to(:successful)
    end
  end

end