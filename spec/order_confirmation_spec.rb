require 'order_confirmation'

describe OrderConfirmation do

  it 'OrderConfirmation.success should eq message' do
    expect(subject.success).to eq('Thank you! Your order was placed and will be delivered before 18:52')
  end

end
