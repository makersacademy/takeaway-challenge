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
    it 'prints a summary of what was added' do
      expect { menu.add(pizza) }.to output("Added pizza\n").to_stdout
    end
  end

  describe '#delete' do
    it 'deletes a dish' do
      menu.add(pizza)
      menu.delete(pizza)
      expect(menu.dishes).not_to include(pizza)
    end
    it 'can delete multiple dishes' do
      menu.add(pizza, pasta)
      menu.delete(pizza, pasta)
      expect(menu.dishes).not_to include(pizza, pasta)
    end
    it 'cannot delete what isnt there' do
      expect { menu.delete(pizza) }.to raise_error("Error: menu does not contain pizza.")
    end
    it 'prints a summary of what was deleted' do
      menu.add(pizza)
      expect { menu.delete(pizza) }.to output("Deleted pizza\n").to_stdout
    end
  end

  describe '#view' do
    it 'prints a description of each dish in menu' do
      menu.add(pizza, pasta)
      expect { menu.view }.to output("~~~Menu~~~\npizza, £5\npasta, £10\n").to_stdout
    end
  end

end
