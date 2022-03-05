require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it 'lets you browse the list of dishes' do
    expect(menu).to respond_to(:browse)
  end

  describe '#browse' do
    it 'outputs each item with price on separate lines' do
      expect { menu.see }.to output("bolognese: 7.50\ncarbonara: 6.50\nputtanesca: 5.50\narrabiata: 4.50\n").to_stdout
    end
  end

end
