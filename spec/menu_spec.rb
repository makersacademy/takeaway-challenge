require 'menu'

RSpec.describe Menu do

  let(:mains) { Menu::MAINS }

  describe '#list' do
    it 'prints a list of available dishes' do
      expect(subject.show).to be_a(String)
    end
  end

  describe '#dishes' do
    it 'recognises hashes inside an array' do
      expect(mains.any? { |meal| meal[:dish] == 'Nihari' }).to be true
    end
  end

  describe '#order' do
    it 'lets a user select the dish/es they want' do
      dish = 'Nihari'
      expect(subject.choose(dish)).to be true
    end
  end

end
