require_relative './../lib/takeaway'

describe Takeaway do
  it 'can list dishes with their prices' do
    expect(subject.menu).to be_an(Object)
  end

  it 'responds to ordering with many arguments' do
    expect(subject).to respond_to(:order).with_unlimited_arguments
  end
end
