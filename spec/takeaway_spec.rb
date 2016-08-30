require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new }

  describe "#view_menu" do
    it "displays the menu upon request" do
      expect(takeaway.view_menu).to eq MENU
    end  
  end


    
end
