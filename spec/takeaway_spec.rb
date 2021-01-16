require 'takeaway'

describe Takeaway do 
  
  context 'On initializing Takeaway' do
    it { is_expected.to respond_to(:basket) }
  end
  
  describe 'read_menu' do
    it 'Shows user a list of dishes and prices' do 
      expect(subject.read_menu).to eq({})
    end
  end

  
end 