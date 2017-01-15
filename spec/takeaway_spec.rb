require 'takeaway'

describe Takeaway do
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

end
