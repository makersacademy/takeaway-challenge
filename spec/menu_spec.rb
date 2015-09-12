require 'menu'

describe Menu do

  let(:dish1){double(:dish1, name: "Dishy1", price: 3.87)}

  describe '#add' do
    it 'adds a new dish to the menu' do
      subject.add(dish1)
      expect(subject.dishes_available.include?(dish1)).to be true
    end
  end

  describe '#view' do
    it 'lists dishes available with price' do
      subject.add(dish1)
      expect{ subject.view }.to output("1: Dishy1 | Price: £3.87\n").to_stdout

    end
  end

end
