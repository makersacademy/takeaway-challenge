require 'takeaway'

describe Takeaway do
  let(:menu_class) { double(:menu_class, :new => menu) }
  let(:menu) { double(:menu, :show_menu =>
      { 'Spring rolls' => 2.99,
      'Prawn toast' => 4.00,
      'Special Chow Mein' => 6.50,
      'Egg Fried Rice' => 2.99 })
  }

  let(:subject) { described_class.new(menu_class) }

  describe '#view_menu' do
    it 'shows a list of items with prices' do
      expect(subject.view_menu).to eq menu.show_menu
    end
  end
end
