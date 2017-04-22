require 'takeaway'

describe Takeaway do

  describe '#initialize' do
    it 'has a menu' do
      expect(subject).to respond_to(:menu)
    end
  end
  
end
