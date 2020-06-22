require 'take_away'
require 'order'
describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order, sms: sms) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:order) { double(:order, total: 15) }
  let(:sms) { double(:sms, send_text: "Thank you! Your order was placed and will be delivered before #{@time}.") }

  let(:printed_menu) { "Egg Rice, £3.99" }

  let(:dishes) {{rice: 2, somosa: 1}}

    it 'shows menu with dishes and prices' do
      expect(takeaway.print_menu).to eq(printed_menu)
    end

    it 'selects some number of several available dishes and places order' do
      allow(order).to receive(:add)
      takeaway.place_order(dishes)
    end
    it 'knows the total price for the order' do
      allow(order).to receive(:add)
      total = takeaway.place_order(dishes)
      expect(total).to eq(15) #not sure what
      #the total would be so I added the
      #total: 15 into the double on line 5
    end
end
