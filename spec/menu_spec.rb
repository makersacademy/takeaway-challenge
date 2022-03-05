require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it 'lets you see the list of dishes' do
    expect(menu).to respond_to(:see)
  end

  describe '#see' do
    it 'outputs each item with price on separate lines' do
      expect { menu.see }.to output("kimchi pancake: 5.99\ntteokbokki: 7.99\nkimchi-jjigae: 12.99\n").to_stdout
    end
  end

end