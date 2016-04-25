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

end