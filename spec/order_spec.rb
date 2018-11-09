require 'order'

describe Order do

  it 'shows an empty array when asked what has been orderd so far' do
    expect(subject.ordered).to eq([])
  end

end
