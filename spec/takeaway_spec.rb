require 'takeaway'

describe Takeaway do
  let(:checkout) { instance_double("Checkout", :basket => {[:"Tempura Mixed Vegetables"]=>3, [:"Spicy Prawn Cracker"]=>3}, :total => 20.4) }
  let(:current_order) { double("current_order", :basket => {}, :total => 0) }
  let(:takeaway) { Takeaway.new }

  it 'displays a welcome message to customers' do
    expect { subject }.to output.to_stdout
  end
  it '#menu' do
    expect { subject.menu }.to output.to_stdout
  end
  it 'allows a user to order dishes and then displays the contents of the basket' do
    expect(subject.order(2,3,11.70)).to eq subject.basket
  end
  it '#order_error?' do
    expect{subject.order(2,3,11.00)}.to raise_error "Total cost given does not match calculated order total"
  end
  it 'allows the user to view their basket' do
    subject.order(1,3,8.7)
    subject.order(2,3,11.7)
    expect{subject.basket}.to output.to_stdout
  end
  it 'allows the user to confirm that they have checkouted ordering' do
    expect(subject).to respond_to(:checkout)
  end
  it 'raises an error if the user tries to checkout with no items in the basket' do
    expect{subject.checkout}.to raise_error "Your basket is currently empty"
  end
  it 'allows the user to checkout ordering and checkout if they have items in the basket' do
    allow(subject).to receive(:send) { "SMS sent" }
    subject.order(2,3,11.7)
    expect{subject.checkout}.not_to raise_error
  end
  it 'gives a confirmation message to the user' do
    allow(subject).to receive(:send) { "SMS sent" }
    subject.order(2,3,11.7)
    expect { subject.checkout }.to output.to_stdout
  end
  it 'converts binary to hex' do
    expect(subject.hex_to_bin('343431')).to eq '441'
  end
  it 'sends a confirmation text message' do
    allow(subject).to receive(:send).and_return nil
    expect(subject.send).to eq nil
  end
end
