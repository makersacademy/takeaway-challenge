require 'takeaway'

describe Takeaway do

  describe '#viewmenu' do
    it 'displays the menu' do
      expect { subject.viewmenu }.to output.to_stdout
    end
  end

end
