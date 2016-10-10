require 'takeaway'

describe Takeaway do

  it { is_expected.to respond_to :list_menu }

  describe "#select" do
    it "should be possible to select dishes from menu" do
      subject.order(:onion_rings, 1)
      
    end
  end

end
