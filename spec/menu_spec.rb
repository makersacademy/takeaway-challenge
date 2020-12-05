describe Menu do
  subject { described_class.new }

  describe "#dish_list" do
    it "shows list of dishes" do
      fish_and_chips = { "Fish and chips" => 10.99 }
      beef_wellington = { "Beef wellington" => 8.99 }
      expect(subject.dish_list).to eq([fish_and_chips, beef_wellington])
    end
  end
end
