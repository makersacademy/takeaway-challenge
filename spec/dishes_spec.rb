require "./docs/dishes"
describe Dishes do

  describe '#menu' do
    it 'can return the menu with price' do
      expect(subject.menu).to include("chicken burger, £10\nfish and chips, £8\nsteak, £20\nchips, £5\nbeef burger, £10")
    end
  end

  describe '#price' do
    it 'can return the price of the dish' do
      expect(subject.price("chicken burger")).to eq(10)
    end
  end
end
