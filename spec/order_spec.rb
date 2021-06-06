require 'order'

describe Order do
  it 'initialises with an empty array' do
    expect(subject.order).to eq []
  end

  it 'displays the menu' do
    expect(subject.menu).to eq Menu
  end

  it 'pushes ordered items into the array' do
    subject.add_item(:tacos)
    expect(subject.order).to eq [:tacos]
  end

  it 'pushes multiple ordered items into the array at once' do
    subject.add_item(:tacos, 3)
    expect(subject.order).to eq [:tacos, :tacos, :tacos]
  end

end