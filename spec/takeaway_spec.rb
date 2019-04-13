require 'takeaway'

describe Takeaway do

  describe '#check_menu' do
    it "displays the menu" do
      expect { subject.check_menu }.to output.to_stdout
    end
  end

  describe '#add_to_order' do
    it "adds to order" do
      # needs test
    end
  end

end
