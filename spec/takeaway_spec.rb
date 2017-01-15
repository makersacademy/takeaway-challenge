require 'takeaway'

describe Takeaway do
  it 'displays a welcome message to customers' do
    expect { subject }.to output.to_stdout
  end
  it 'displays a menu to the user' do
    expect { subject.menu }.to output.to_stdout
  end
  it 'allows a user to order dishes and then displays the contents of the basket' do
    expect(subject.order(2,3,11.70)).to eq subject.basket
  end
end
