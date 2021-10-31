require_relative './../lib/takeaway'

describe Takeaway do
  it 'can list dishes with their prices' do
    expect(subject.menu).to be_an(Object)
  end
end
