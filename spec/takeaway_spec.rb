require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu }
  let(:current_order) { double :current_order }
  let(:sms_client) { double :sms_client }
  let(:takeaway) { Takeaway.new(menu, current_order, sms_client) }

  describe '#see_menu' do
    it 'calls the see_menu method in the Menu class' do
      expect(menu).to receive(:user_menu)
      takeaway.see_menu
    end
  end

  describe '#add_item' do
    it 'raises an error if the user enters item that is not on the menu' do
      expect { subject.add_item('vegan burger', 1) }.to raise_error('Please choose valid menu option')
    end

    it 'raises error if quantity is not a valid integer' do
      expect { subject.add_item('curry goat', '1') }.to raise_error('Quantity must be a valid integer')
    end

    it 'calls the add method in the Order class' do
      allow(takeaway).to receive(:not_on_menu?) { false }
      expect(current_order).to receive(:add)
      takeaway.add_item('curry goat', 1)
    end
  end

  describe '#review_order' do
    it 'prints out Order basket items, quantities, subtotals and total' do
      subject.add_item('beef patty', 1)
      subject.add_item('fried dumpling', 2)
      expect { subject.review_order }.to output(
      "Your order\nx1 beef patty, £2.50\nx2 fried dumpling, £3.00\nTotal: £5.50\n"
      ).to_stdout
    end
  end

  describe '#place_order' do
    it 'calls the process order method' do
      expect(subject).to receive(:process_order)
      subject.place_order('Malachi', ENV['MOBILE_NUMBER'])
    end
  end
end