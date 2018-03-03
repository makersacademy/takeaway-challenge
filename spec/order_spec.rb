require 'order'

describe Order do

  subject(:menu) { described_class.new(dbl_menu) }
  let(:dbl_menu) { double :menu,
    print: "1. Samosa, £1.0\n"
   }

    it 'lets you see the menu' do
      expect(menu.show_menu(false)).to eq "1. Samosa, £1.0\n"
    end

end
