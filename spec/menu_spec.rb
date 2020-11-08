require 'menu'

describe Menu do
  describe '#dishes' do
    it 'returns the MENU constant' do
      expect(subject.dishes).to eq(Menu::MENU)
    end
  end
  
  describe '#user_menu' do
    it 'prints the available dishes and their prices' do
      expect { subject.user_menu }.to output.to_stdout
    end
  end
end