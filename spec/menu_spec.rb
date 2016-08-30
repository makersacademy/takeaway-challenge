require 'menu'

describe Menu do

  context 'shows menu items' do

    it 'prints to output the menu items and prices' do
    expect(subject.show_menu).to be_a String
    end
    
  end
end
