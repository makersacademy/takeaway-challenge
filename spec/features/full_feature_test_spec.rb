require 'takeaway'

describe 'Full Feature Test' do
  let(:sms) { double :sms }

  def one_hours_time
    now = Time.new
    "%02d" % (now.hour + 1) + ":" + "%02d" % now.min
  end

  it 'should order a takeaway' do
    config = { sms: sms }
    takeaway = Takeaway.new(config)
    dishes = takeaway.dishes
    takeaway.add_to_basket(dishes[3], 1)
    takeaway.add_to_basket(dishes[5], 3)
    takeaway.add_to_basket(dishes[6], 1)
    takeaway.add_to_basket(dishes[9], 2)
    takeaway.total_price
    allow(sms).to receive(:send)
    expect(sms).to receive(:send).with(
      "Thank you! Your order was placed and will be delivered before #{one_hours_time}"
    )
    takeaway.place_order
  end
end
