describe Menu do
  subject { described_class.new }

  describe "#dish_list" do
    it "shows list of dishes" do
      expect(subject.dish_list.size).to eq(2)
      expect(subject.dish_list).to all(be_kind_of(Dish))
    end
  end
end
