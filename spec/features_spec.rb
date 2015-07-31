require 'takeaway'

describe 'Features' do
  let(:takeaway) { Takeaway.new }
  
  describe '#menu' do
    it { expect(takeaway.menu).not_to be_empty }
      
  end
  
end