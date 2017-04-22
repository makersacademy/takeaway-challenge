require 'takeaway'

describe Takeaway do

  it "responds to view_menu method" do
    expect(subject).to respond_to :view_menu
  end

  describe "#view_menu" do
    it "displays list of items with prices" do
      expect(subject.view_menu).to eq subject.menu
    end
  end

  describe "#select_items" do
    it "allows users to select/save specific items on the menu" do
      expect(subject).to respond_to :select_items
    end

    it "allows users to"

  describe "check_total" do
    it ""
  end

  describe "order_confirm" do
    it ""
  end
end
