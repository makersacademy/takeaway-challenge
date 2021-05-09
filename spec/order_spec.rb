require 'order'

describe Order do
  it 'has an empty order by default' do
    expect(subject.current).to eq([])
  end

  it 'displays the order' do
    expect(subject.display).to eq("Empty order")
  end
end