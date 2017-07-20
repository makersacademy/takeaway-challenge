require 'menu'
require 'dish'
require 'order'

describe Menu do

  subject(:menu) { described_class.new }

  describe '#initialization' do
    it 'builds an empty menu upon initialization' do
      expect(subject.list_of_dishes.count).to eq 0
    end
  end

  describe 'filling in the menu' do
    before(:each) do
      subject.add_dish("Fries", 5)
      subject.add_dish("Pizza", 6)
      subject.add_dish("Sushi", 8)
    end

    describe '#add_dish' do
      it 'adds a dish into the menu instance variable' do
        expect(subject.list_of_dishes.count).to eq 3
      end
    end
