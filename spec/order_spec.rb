require 'order'

describe Order do
  let(:order) { [{ dish: 'fish', price: 5 }] }
  it 'checks total of order' do
    expect(subject.check_total(order)).to eq 5
  end
end
