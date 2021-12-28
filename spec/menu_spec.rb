require 'menu'

describe Menu do
  subject(:menu) { described_class.new(items) }
  let(:items) { {Soup: 2, Bread: 1} } 

  it 'takes a list of menu items and their prices' do
    expect(menu.items).to eq ( { Soup: 2, Bread: 1 } )
  end

  describe '#print_menu' do
    it "formats the menu, ready to be printed" do
      expect(menu.print_menu).to eq ("Soup ~ £2.00 | Bread ~ £1.00")
    end
  end

end