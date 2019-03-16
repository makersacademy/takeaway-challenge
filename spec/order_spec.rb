require 'order'
describe Order do
  it 'can add items to itself' do
    expect(subject).to respond_to :add
  end

  it 'is empty by defalt' do
    expect(subject.full).to eq([])
  end
end
