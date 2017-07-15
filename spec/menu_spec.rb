require 'menu'

describe Menu do
  subject(:thai) { described_class.new }

  it { is_expected.to respond_to(:menu) }

  it 'menu should contain dishes with prices in a hash' do
    menu_hash = { "Green Curry" => 6, "Massaman Curry" => 6,
                  "Panang Curry" => 6, "Pad Thai" => 7,
                  "Rice" => 2, "Pad Pak" => 3,
                  "Singha" => 4 }
    expect(thai.menu).to eq menu_hash
  end

  describe '#view_menu' do

      # let(:menu) { double(:menu, dish: "Green Curry", price: 6 )}

    it 'should show the dishes' do
      expect { thai.view_menu }.to output("Green Curry: £6\nMassaman Curry: £6\nPanang Curry: £6\nPad Thai: £7\nRice: £2\nPad Pak: £3\nSingha: £4\n").to_stdout
    end

  end
end
