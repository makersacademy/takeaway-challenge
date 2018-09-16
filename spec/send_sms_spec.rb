require 'send_sms'

# it { is_expected.to respond_to(:text) }
describe '#text' do
  it 'sends a order confirmation text message' do
    menu = Menu.new
    expect(menu.text).to receive(:text).with("Thank you! Your order was placed and will be delivered t " + (Time.now + 3600).to_s)
    # takeaway.complete_order(20.93)
  end
end
