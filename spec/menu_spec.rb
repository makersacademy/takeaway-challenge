require 'menu'

describe Menu do

    it 'should contain MY_MENU' do
      expect(subject.dishes).to eq(Menu::MY_MENU)
    end

end

