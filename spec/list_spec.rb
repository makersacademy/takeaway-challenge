require 'list'

describe List do
  it 'a margherita should cost 10£' do
    expect(subject.list[:pizza][:margherita]).to eq 7.5
  end

  it 'a bottle of red wine should cost 24.95£' do
    expect(subject.list[:drink][:red]).to eq 24.95
  end
end
