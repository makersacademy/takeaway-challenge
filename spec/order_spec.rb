describe Order do
  subject { described_class.new(Menu.new) }

  describe "#add_dish" do
    it "adds dishes to order" do
      subject.add_dish("Fish and chips")
      subject.add_dish("Beef wellington")
      expect(subject.order).to eq([ { "Fish and chips" => 10.99 }, { "Beef wellington" => 8.99 } ])
    end
  end
end
