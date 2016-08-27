require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  describe '.format_menu' do
     it 'returns formatted menu items' do
       expect(menu.format_menu).to include "Tribute Burger: £10.50"
     end
  end

end
