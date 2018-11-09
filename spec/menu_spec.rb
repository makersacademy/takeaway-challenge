require 'menu'

describe Menu do
  let(:dish) { double('dish') }

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
    it 'shows each dish that has been added' do
      subject.add_dish(dish)
      expect(STDOUT).to receive(:puts).with(dish)
      subject.display_menu
    end
  end

end
