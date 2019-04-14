require 'takeaway'

describe Takeaway do
  let(:takeaway) {described_class.new}

  describe "#view_menu" do
    it 'lets users see what they can order' do
      expect(takeaway.view_menu).to eq "Spare Ribs"=>6.00, "Seaweed"=>4.50, "Half Duck"=>20.00
    end
  end

  
end
