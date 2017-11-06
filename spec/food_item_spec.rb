require 'food_item'
describe FoodItem do
let(:food) {'beer'}

  let (:food_item) {(double(described_class.new))}
  describe "#add_item" do
    xit "responds to method" do
      expect(subject).to respond_to(:add)
    end
    it "returns a hash" do
      expect(subject.add).to be_kind_of(Hash)
    end
  end

  describe "#find_price" do
    xit "responds to method" do
      expect(subject).to respond_to(:find_price)
    end
  end

  describe "#find_price" do
    it "fetches its price from the module" do

      expect(subject.find_price(food)).to eq (2)
    end
  end


end
