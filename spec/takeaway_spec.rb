require 'takeaway'

describe Takeaway do
  describe '#menu' do
    it 'shows the customer a menu' do
      expect { subject.menu }.to output.to_stdout
    end
  end
end