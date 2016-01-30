require 'takeaway'
require 'dotenv'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu) }
  let(:choice) { {beef:2, rolls:3} }
   let(:menu) { double :menu, show: {ribs: 3,
    beef: 4,
    rolls: 3,
    chips: 2,
    pies: 5} }

    describe '#show_menu' do
      it 'returns a menu' do
        expect(takeaway.show_menu).to eq menu.show
      end
    end

    describe '#select' do
      it 'selects a few dishes from the menu' do
        expect(takeaway.select(choice, 20)).to eq choice
      end
    end

    describe '#confirm_order' do
      it 'confirms if the correct total is entered' do    
        confirm = "Thank you! Your order was placed "\
        "and will be delivered before "\
        "#{(Time.now+ 60*60).strftime("%H:%M")}"
        allow(takeaway).to receive(:send_text).with(confirm).and_return(confirm)
        takeaway.select(choice, 17)
        expect(takeaway.confirm_order).to eq confirm
      end

      it 'raises error when the incorrect total is entered' do
        takeaway.select(choice, 24)
        expect {takeaway.confirm_order}.to raise_error("incorrect bill amount")
      end
    end
  end
