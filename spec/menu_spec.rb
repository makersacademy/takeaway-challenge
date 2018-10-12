require 'menu'

describe Menu do
  let(:menu) { Menu.new }
  let(:pizza) { double(:pizza, name: "pizza", price: 5, to_s: "pizza") }
  let(:pasta) { double(:pasta, name: "pasta", price: 10, to_s: "pasta") }

  it 'has no dishes by default' do
    expect(menu.dishes).to be_empty
  end

  it 'can be initialized with dishes' do
    menu = Menu.new([pizza, pasta])
    expect(menu.dishes).to eq([pizza, pasta])
  end

  it 'displays dishes with prices' do
    menu = Menu.new([pizza, pasta])
    expect { menu.view }.to output("~~~Menu~~~\npizza, £5\npasta, £10\n").to_stdout
  end

  describe '#add' do
    it 'adds a dish' do
      menu.add(pizza)
      expect(menu.dishes).to include(pizza)
    end
    it 'can add multiple dishes' do
      menu.add(pizza, pasta)
      expect(menu.dishes).to include(pizza, pasta)
    end
  end

end
