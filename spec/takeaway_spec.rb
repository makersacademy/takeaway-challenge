require "takeaway"

describe TakeAway do

  describe "#menu" do

    it "can receive take away menu" do
      expect(subject.show_menu).to eq ({
        :pasta => 6,
        :pizza => 10,
        :ramen => 7,
        :soup => 3 
      })
    end

  end
  
  describe "#valid?" do

    it "returns false when input is not valid " do
      expect(subject.valid?("blahh")).to eq false
    end

    it "returns true when input is valid" do
      expect(subject.valid?("pizza")).to eq true
    end

  end

  describe "#finish" do

    it "returns false before order is complete" do
      expect(subject.finish?).to eq false
    end

    it "returns true when order is complete" do
      subject.add("pizza")
      subject.complete
      expect(subject.finish?).to eq true
    end

  end
  
end
