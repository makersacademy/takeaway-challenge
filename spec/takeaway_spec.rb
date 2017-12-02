require 'takeaway'

describe Takeaway do
  it {is_expected.to respond_to(:menu)}

  describe "#menu" do
    it "should show a list of dishes when looking at the menu" do
      expect(subject.menu).to eq ({"prawn crackers"=>2.00, "summer roll"=>4.50, "spring rolls"=>3.99, "pho"=>10.99, "bun thit nuong"=>9.50, "seafood stir fry"=>13.99, "coke"=>1.50, "water"=>1.25})
    end
  end
end
