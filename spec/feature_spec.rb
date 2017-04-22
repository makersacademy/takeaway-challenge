# unit test on Takeaway mainly redundant as _
# Takeaway class mostly calls other classes

require 'takeaway'

describe Takeaway do
  context 'generated with a Test menu' do

    let(:menu) { double :menu, menu: [{ 'Test' => 1.5 }] }
    let(:printer) { double :printer }

    test_takeaway = described_class.new('Test')

    describe 'Menu creation' do
      it 'can get a #menu' do
        expect(test_takeaway.takeaway_menu).to eq [{ 'Test' => 1.50 }]
      end

      it 'can display a menu' do
        test_takeaway.show_menu
        expect(test_takeaway.menu_on_screen).to eq ['1. Test (£1.50)']
      end
    end

    describe 'ordering' do
      it 'adds an item to the basket' do
        2.times { test_takeaway.order(1) }
        expect(test_takeaway.basket.current_order).to eq [{ 'Test' => 1.5 }, { 'Test' => 1.5 }]
      end
    end

  end
end
