require 'order'
require 'dishes'

describe Order do
  # subject(:order) { described_class.new }

  it "has an empty array for new order" do
    expect(subject.basket).to eq Array.new(0)
  end

  describe "#select_dishes" do
    it "returns an array of selected available dishes" do
      expect { subject.select_dishes(1) }.to change { 
        subject.basket }.from(Array.new(0)).to([{:name=>"Diet (not really) Pizza", :price=>5.99}])
    end

    it "raises an error when dish is not available" do
      allow(subject).to receive(:dish_available).and_return(false)
      expect { subject.select_dishes(16) }.to raise_error("Dish is not available. Please choose a different dish.")
    end
  end

end
