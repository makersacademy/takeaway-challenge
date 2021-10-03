require "menu"

describe Menu do
  describe "#see_list" do
    it "returns a list of dishes" do
      expect(subject.list.count).to eq 3
    end
  end
end
