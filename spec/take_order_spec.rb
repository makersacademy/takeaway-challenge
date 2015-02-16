require 'take_order'

describe Checkout do

  let(:checkout){ Checkout.new }
  let(:checkout2){ double :checkout, :pay_money => @money != @total }

  it 'should tell the customter that their food will be delivered with an hour' do
    expect(checkout.delivery_time).to eq (Time.new + 3600)
  end #when this is tested it fails as the time is less than a millisecond apart

  it 'should raise an error if the money doesn\'t match the total' do
    expect(checkout2.pay_money).to raise_error(RuntimeError, "You have entered an incorrect amount, please reenter")
  end

end