require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu, view: "Cod: £4\nSausage: £3\nChips: £2\n" }
  let(:takeaway) { described_class.new menu }
  menu_expect = "Cod: £4\nSausage: £3\nChips: £2\n"
  bill = "Thanks for your order\n2 x Cod = £8\n2 x Chips = £4\nTotal = £12"
  let(:order_1) { double :order, final_bill: bill }

  before do
    takeaway.customer 'Bob', '555-1234'
  end

  it 'knows its customer\'s name' do
    expect(takeaway.customer_name).to eq 'Bob'
  end

  it 'knows its customer\'s number' do
    expect(takeaway.customer_number).to eq '555-1234'
  end

  it 'has a menu' do
    expect(takeaway.show_menu).to eq menu_expect
  end

  it 'can present the customer with checkout confirmation' do
    expect(takeaway.confirm_checkout order_1).to eq bill
  end

  # it 'can text a customer with delivery confirmation' do
  #   text = "Thank you! Your order will be delivered before d_time"
  #   allow(Message).to receive(:send_text).and_return text
  #   expect(takeaway.text_confirmation(true, true)).to eq text
  # end
end
