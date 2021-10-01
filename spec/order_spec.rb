require "order"

describe Order do
  describe "#initialize" do
    it "initializes an empty order" do
      expect(subject.items).to eq []
    end
  end

  # describe "#add" do
  #   it "allows user to add item to order" do
  #   end
  # end
end