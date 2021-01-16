require 'takeaway'

describe Takeaway do 
  
  context 'On initializing Takeaway' do
    it { is_expected.to respond_to(:basket) }
    it { is_expected.to respond_to(:menu) }
  end
  
  describe 'read_menu' do
    it 'Shows user a list of dishes and prices' do 
      expect(subject.read_menu).to include(:"chicken balls" => 2.0, :"chow mein" => 1.99, :"duck pancakes" => 1.0)
    end
  end

  
end 