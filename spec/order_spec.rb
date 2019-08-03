require 'order'

describe Order do
  it 'adds 1 pizza to the order' do
    subject.add_item(:pizza)
    expect(subject.total_order).to eq [{pizza: 1}]
  end
end
