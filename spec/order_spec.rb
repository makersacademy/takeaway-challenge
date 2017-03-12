require 'order'

describe Order do
  it 'receives the user selection' do
    expect(subject).to respond_to(:add).with(2).arguments
    subject.add(2, 3)
  end
  it 'adds the users selection to the basket' do
    expect { subject.add(2, 3) }.to change { subject.basket.size }.by(1)
  end
  it 'adds the price of the selection to the order total' do
    expect { subject.add(2, 3) }.to change { subject.total }.by(anything)
  end
end
