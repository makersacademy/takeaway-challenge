require 'menu'

describe Menu do
  let(:dish) { double :dish, name: "catfish", price: 1 }

  it 'shows an empty list of dishes from the start' do
    expect(subject.dishes).to eq([])
  end

  describe '#add_dish' do
    it 'adds a dish to the menu when asked to :D' do
      subject.add_dish(dish)
      expect(subject.dishes).to eq([dish])
    end

    it 'adds many dishes to menu when asked' do
      3.times { subject.add_dish(dish) }
      expect(subject.dishes).to eq([dish, dish, dish])
    end
  end

  describe '#display_menu' do
    it 'shows a dish that has been added as well as its price' do
      subject.add_dish(dish)
      expect(STDOUT).to receive(:puts).with("catfish, £1")
      subject.display_menu
    end

    it 'shows a list of crazy dishes with prices' do
      broccoli = double :broccoli, name: "broccoli", price: 2
      aubergine = double :aubergine, name: "aubergine", price: 10_000
      pumpkin = double :pumpkin, name: "pumpkin", price: 3
      subject.add_dish(broccoli)
      subject.add_dish(aubergine)
      subject.add_dish(pumpkin)
      expect(STDOUT).to receive(:puts).with("broccoli, £2")
      expect(STDOUT).to receive(:puts).with("aubergine, £10000")
      expect(STDOUT).to receive(:puts).with("pumpkin, £3")
      subject.display_menu
    end
  end

end
