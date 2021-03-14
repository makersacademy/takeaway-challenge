require 'menu'

describe Menu do
  describe '#display' do
    
    it 'outputs menu items to STDOUT' do
      expect { subject.display }.to output(/Hamburger/&&/Chips/).to_stdout
    end
  end
end
