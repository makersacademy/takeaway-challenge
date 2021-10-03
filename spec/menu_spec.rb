require "menu"

describe Menu do
  describe "#list" do
    it "lists menu with dishes and prices" do
      expect(subject.list).to eq({ :Pizza => 8, :Chicken => 6 })
    end
  end
end
