require 'restaurant'

describe Restaurant do

  let(:menu){{"Curry" => 5, "Rice" => 2, "Beer" => 3}}

  describe "#menu" do

    it "should show a list of food" do
      expect(subject.menu).to eq menu
    end

    it "should protect @menu variable from tampering" do
      subject.menu.clear
      expect(subject.menu).to eq menu
    end
  end

  describe "#add_to_order" do

    it "should add a single item by default" do
      subject.add_to_order("Curry")
      expect(subject.order).to include ({"Curry" => 1})
    end

    it "should allow multiple dishes to be added at once" do
      subject.add_to_order("Curry", 5)
      expect(subject.order).to include ({"Curry" => 5})
    end

  end

end