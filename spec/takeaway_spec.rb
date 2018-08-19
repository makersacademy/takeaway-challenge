require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new }


  describe "#view_menu" do
    it "shows a shows a list of dishes with prices" do
      expect(takeaway.view_menu).to eq({ "Pepperoni" => 7.50, "Hawaiian" => 6.50, "vegetarian" => 5.50 })
    end
  end

  describe "#add_to_order" do
    it "can select some number of several available dishes" do
      expect(takeaway).to respond_to(:add_to_order).with(2).arguments
    end
  end

end
