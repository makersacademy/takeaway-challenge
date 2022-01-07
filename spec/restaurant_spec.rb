require 'restaurant'

describe Restaurant do
  before :all do
    @menu = { taco: 5, pasta: 10, pizza: 15, burger: 3, golden_taco: 999 }
  end
  subject { described_class.new(@menu) }

  describe '.new' do
    it 'takes a menu as an argument' do
      expect(described_class).to respond_to(:new).with(1).argument
    end 
  end

  describe '#menu' do
    it 'returns the menu given on creation' do
      expect(subject.menu).to eq(@menu)
    end
    it 'returns a copy of the menu' do
      menu_copy = subject.menu
      menu_copy[:taco] = 0
      expect(subject.menu[:taco]).not_to eq(0)
    end
  end
end
