require 'message'

describe Message do

subject { described_class.new }

  it 'the class exsists' do
    expect { subject }.not_to raise_error
  end

  it 'sends a text' do
    expect( subject.send_text ).to eq "Thank you! Your order was placed and will be delivered before #{subject.delivery_time}"
  end
end
