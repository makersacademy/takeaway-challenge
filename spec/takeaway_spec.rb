require 'takeaway'

describe Takeaway do

  subject(:takeaway) {Takeaway.new}

  describe "#view_menu" do
    it "responds to #view_menu" do
      expect(takeaway).to respond_to :view_menu
    end
  
    it "prints out the menu on request" do
    expect(takeaway.view_menu).to include("Fish and Chips")
    end

  end




end

