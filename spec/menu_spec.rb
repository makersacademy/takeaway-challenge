require 'menu'

describe Menu do

  subject(:menu) {described_class.build_default_menu}

  describe '#print_menu' do
    it 'Prints the menu in a nice way' do
      expect{ menu.print_menu }.not_to raise_error
    end


  end


end
