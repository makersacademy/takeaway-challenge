require 'order'

describe Order do
  it 'adds 1 pizza to the order' do
    subject.add_item(:pizza)
    expect(subject.total_order).to eq [{ pizza: 1 }]
  end
  it 'adds 3 kebabs to the order' do
    subject.add_item(:kebab, 3)
    expect(subject.total_order).to eq [{ kebab: 3 }]
  end
  it 'adds 1 pizza to then order, then 3 kebabs' do
    subject.add_item(:pizza)
    subject.add_item(:kebab, 3)
    expect(subject.total_order).to eq [{ pizza: 1 }, { kebab: 3 }]
  end
end
