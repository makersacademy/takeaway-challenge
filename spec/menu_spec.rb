require 'menu'

describe 'Menu' do 
  subject(:menu) { Menu.new } 
   

    it 'prints a list of dishes and prices.' do 
        expect(menu.printed_dishes).to include "chips"
    end
end

