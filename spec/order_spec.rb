require 'order'

describe Order do
  it 'should be initialized with no items' do
    expect(subject.items.length).to eq 0
  end
end
