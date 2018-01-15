require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#read' do
    it 'returns a price list' do
      list = { 'spring rolls' => 1.99, 'prawn toast' => 1.99,
         'egg fried rice' => 2.50, 'kung po chicken' => 4.50 }
      expect(menu.read).to eq list
    end
  end
end
