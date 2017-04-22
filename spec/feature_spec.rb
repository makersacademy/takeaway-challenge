# unit test on Takeaway mainly redundant as _
# Takeaway class mostly calls other classes

require 'takeaway'

describe Takeaway do
  context 'basics' do

    let(:menu) { double :menu, menu: [{ 'Test' => 1.50 }] }
    let(:printer) { double :printer }

    test_takeaway = described_class.new('Test')

    it 'can get a #menu' do
      expect(test_takeaway.takeaway_menu).to eq [{ 'Test' => 1.50 }]
    end

    it 'can display a menu' do
      test_takeaway.show_menu
      expect(test_takeaway.menu_on_screen).to eq ['1. Test (£1.50)']
    end
  end
end
