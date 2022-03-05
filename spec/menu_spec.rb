require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it 'lets you see the list of dishes' do
    expect(menu).to respond_to(:see)
  end

  it 'lets you select some number of available dishes' do
    expect(menu).to respond_to(:select).with(2).arguments
  end

  describe '#see' do
    it 'outputs each item with price on separate lines' do
      expect { menu.see }.to output("kimchi pancake: 5.99\ntteokbokki: 7.99\nkimchi-jjigae: 12.99\n").to_stdout
    end
  end

  describe '#select' do
    it 'adds x number of dishes to the basket' do
      expect { menu.select('tteokbokki', 2) }.to change { menu.basket.count }.by(2)
    end
  end

end
