require "takeaway"

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }

  let(:menu) { double(:menu, list: listed_menu) }

  let(:listed_menu) { "Pizza: 8" }

  describe "#list_menu" do
    it "lists menu with dishes and prices" do
      expect(takeaway.list_menu).to eq(listed_menu)
    end
  end
end
