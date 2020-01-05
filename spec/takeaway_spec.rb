require 'takeaway'

describe Takeaway do
  let(:menu_printer){double :menu_printer, :print_menu => "menu\n"}
  subject{Takeaway.new(menu_printer)}

  describe '#show_menu' do
    it 'shows menu in pretty format using provided menu printer' do
      expect(menu_printer).to receive(:print_menu).with(hash_including(:headers, :items))
      subject.show_menu
    end
    it 'show how to order details at bottom of order and name at top' do
      expect(subject.show_menu).to eq("#{Takeaway::RESTURANT_NAME}menu\nPlease use the following comma seperated order format whether ordering directly or via text: '<item1>, <quantity>, <item2>, <quantity>, etc..., <total_price>, <long_format_phone_number>' ")
    end
  end

  describe '#place_order' do
    it 'raises error if order is not string' do
      order = Hash.new
      expect{subject.place_order(order)}.to raise_error('Order not in correct format')
    end
    it 'raises error if order is in incorrect format' do
      order = String.new
      expect{subject.place_order(order)}.to raise_error('Order not in correct format')
    end
    it 'accepts orders of the correct format' do
      order = 'pizza, 2, sides, 4, drink, 2, 54, +447234213433'
      expect(subject.place_order(order)).to eq('Order recieved, you should recieve a text confirmation shortly!')
    end
  end
end
