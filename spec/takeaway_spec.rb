require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new() }
  
  describe "#menu" do
    it 'returns an array' do
      expect(takeaway.menu).to_not be_empty
    end
  end
end
