require 'takeaway'
require 'menu'
require 'order'

describe Takeaway do
  subject (:takeaway) { Takeaway.new }

  let (:menu) { double("menu", view: "Menu") }

  it 'is a takeaway' do
    expect(takeaway).to be_a Takeaway
  end

  describe '#view_menu' do
    it { is_expected.to respond_to(:view_menu) }

    context 'when printing to stdout' do
      specify { expect { takeaway.view_menu }.to output(MENU).to_stdout }

      # Mock
      it 'shows a menu' do
        allow(takeaway).to receive(:view_menu) { "Menu" }

        expect(takeaway.view_menu).to eq "Menu"
      end
    end
  end

  describe '#select' do
    it { is_expected.to respond_to(:select).with_unlimited_arguments }
  end

  describe '#view_order' do
    it { is_expected.to respond_to(:view_order) }

    context 'when printing to stdout' do
      before do
        takeaway.select(1, 4, 6)
      end

      specify { expect { takeaway.view_order }.to output(ORDER_SUMMARY).to_stdout }

      # Mock
      it 'shows a summary of the current order' do
        allow(takeaway).to receive(:view_order) { "Order summary" }
  
        expect(takeaway.view_order).to eq "Order summary"
      end
    end
  end
end
