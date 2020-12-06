describe Menu do
  subject { described_class.new }

  describe "#dish_list" do
    it "shows list of dishes" do
      dishes = {
        "Fish and chips" => 10.99,
        "Beef wellington" => 8.99
      }

      expect(subject.dish_list).to eq(dishes)
    end
  end
end
