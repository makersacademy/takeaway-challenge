require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:pizza) { double :pizza }
  let(:hamburger) { double :hamburger }
  let(:curry) { double :curry }
  let(:chips) { double :chips }
  let(:cake) { double :cake }

  describe '#list' do
    it 'can show a list of dishes with prices' do
      expect(menu.list).to eq(pizza: 6,
                                hamburger: 7,
                                curry: 5,
                                chips: 3,
                                cake: 4)
    end
  end

  describe '#pizza' do
    it 'can show this dish with price' do
      expect(menu.pizza).to eq(pizza: 6)
    end
  end

  describe '#hamburger' do
    it 'can show this dish with price' do
      expect(menu.hamburger).to eq(hamburger: 7)
    end
  end

  describe '#curry' do
    it 'can show this dish with price' do
      expect(menu.curry).to eq(curry: 5)
    end
  end

  describe '#chips' do
    it 'can show this dish with price' do
      expect(menu.chips).to eq(chips: 3)
    end
  end

  describe '#cake' do
    it 'can show this dish with price' do
      expect(menu.cake).to eq(cake: 4)
    end
  end
end
