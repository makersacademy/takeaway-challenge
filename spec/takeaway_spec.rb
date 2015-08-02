require 'takeaway'

describe Takeaway do

  let(:twilio_sender) { double :twilio_sender }

  subject { Takeaway.new twilio_sender }

  it { is_expected.to respond_to(:display_menu) }

  it { is_expected.to respond_to(:select_items).with(2).arguments }

  it 'can choose items and quantities from the menu' do
    subject.select_items(:chicken, 1)
    subject.select_items(:beer, 3)
    expect(subject.selection).to include({ chicken: 1, beer: 3 })
  end

  it 'can add multiple of the same item separately' do
    subject.select_items(:chicken, 1)
    subject.select_items(:chicken, 1)
    expect(subject.selection).to include({ chicken: 2 })
  end
  # made private method
  # it 'can get the price of an item' do
  #     expect(subject.get_price(:wine)).to eq(7.99)
  # end

  it 'can calculate the total price of a bill' do
    subject.select_items(:chicken, 1)
    subject.select_items(:kebab, 2)
    expect(subject.total).to eq("£12.97")
  end

  it 'can send a message when an order is made' do
    phone_number = '447825786185'
    time = Time.new 2015, 8, 2, 20, 14
    allow(Time).to receive(:new) { time }
    expect(twilio_sender).to receive(:send_text).with("447825786185", "Thanks! Your order should be delivered before 21:14, The total is £0.00")
    subject.order("447825786185", "£0.00")
  end

  it 'raises an error if the amount is not confirmed when ordering' do
    subject.select_items(:beer, 1)
    expect{ subject.order('447825786185', 0.00) }.to raise_error('Cannot confirm this order')
  end

end
