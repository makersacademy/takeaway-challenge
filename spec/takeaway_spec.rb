require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new }
  let(:meal1) {double "Fish and Chips" }

  describe "#view_menu" do
    it "prints out the menu on request" do
    expect(takeaway.view_menu).to eq MENU
    end

  end

  describe "#select_food" do
    it "responds to #select_food" do
      expect(takeaway).to respond_to(:select_food).with(1).arguments
    end

    it "returns the menu selection on input" do
       expect(takeaway.select_food).to include("Fish and Chips")
    end
  end

end
