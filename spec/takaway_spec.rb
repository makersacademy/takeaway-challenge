require 'takaway'

describe Takaway do
  let(:menu_printer){double :menu_printer, :print_menu => 'menu'}
  subject{Takaway.new(menu_printer)}

  describe '#show_menu' do
    it 'shows menu in pretty format using provided menu printer' do
      expect(menu_printer).to receive(:print_menu).with(hash_including(:headers, :items))
      subject.show_menu
    end
  end
end
