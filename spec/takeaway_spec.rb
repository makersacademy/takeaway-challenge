require 'takeaway'

describe Takeaway do


  describe "#view_menu" do
    it "shows a list of dishes with prices" do
      expect(subject).to respond_to(:view_menu)
    end
  end



end
