require 'menu'

describe Menu do

  describe 'initialize' do
    it 'initialize blank hash for order choice' do
      expect(subject.order_choice).to be_empty
    end
  end

  it 'should give user a list of menu dishes' do
    expect(subject.menu_dishes).to eq Menu::MENU_LIST
  end

  
end
