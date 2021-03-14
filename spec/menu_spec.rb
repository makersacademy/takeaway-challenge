require 'menu'

describe Menu do 

  describe 'when created' do 
    it { is_expected.to respond_to(:menu) }
  end 

  describe '#see_menu' do
    it 'prints a list of dishes and prices' do  
      expect { subject.see_menu }.to output("McDonalds Breakfast Menu\n------------------------\nEgg McMuffin.....£2.50\nHash Brown.....£1.00\n").to_stdout
    end
  end 
end
