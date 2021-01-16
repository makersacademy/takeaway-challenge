require 'order'

describe Order do

  it 'creates an list of selected dishes' do
    expect(subject.add_to_order("pizza", 1 )).to eq [{"pizza" =>10}, (1)]
  end
  it 'shows order so far' do
    expect(subject.show_order).to eq []
  end
end
