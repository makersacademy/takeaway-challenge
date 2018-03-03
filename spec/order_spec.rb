require 'order'

describe Order do

  it 'Should initialize with an empty current_order' do
    expect(subject.current_order).to eq []
  end
end
