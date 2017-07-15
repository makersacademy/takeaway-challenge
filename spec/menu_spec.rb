require 'menu'
require 'dish'

describe Menu do

  subject(:menu) { described_class.new }

  describe '#initialization' do
    it 'builds an empty menu upon initialization' do
      expect(subject.list_of_dishes.count).to eq 0
    end
  end

  describe '#add_dish' do
    it 'adds a dish into the menu instance variable' do
      subject.add_dish("Fries", 5)
      subject.add_dish("Pizza", 6)
      subject.add_dish("Sushi", 8)
      expect(subject.list_of_dishes.count).to eq 3
    end
  end

  describe '#show_menu' do
    let(:dish) { double :dish }
    it 'shows menu when requested' do
      subject.add_dish("Fries", 5)
      subject.add_dish("Pizza", 6)
      expect(subject.show_menu).to eq "1. Fries, £5\n2. Pizza, £6"
    end
  end
end
