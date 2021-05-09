require 'order'

describe Order do
  it 'has an empty order by default' do
    expect(subject.current).to eq([])
  end
end