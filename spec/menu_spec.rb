require 'menu'

describe Menu do

  it 'returns a list of items with prices when requested' do
    expect(subject.list).to eq "Fish - £1.49" # \nChips - £0.49\nFalafel - £1.99\nEgg - £0.49"
  end

end
