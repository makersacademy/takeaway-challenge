require 'dish'

describe Dish do
  
  subject {described_class.new("Sushi", 7)}
  
  describe "#name" do
    it "returns the name of the dish" do
      expect(subject.name).to eq "Sushi"
    end
  end

  describe "#price" do
    it "returns the price of the dish" do
      expect(subject.price).to eq 7
    end
  end

end

