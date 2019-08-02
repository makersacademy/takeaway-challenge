require 'order'

describe Order do
  it_behaves_like ItemList

  let(:dish) {double(:dish,change_cost: 0,name: "Tuna",cost: 6)}

  it 'adds multiple items' do
    expect {subject.add_items(dish,5)}.to change{subject.items.count}.by(5)
  end



  it 'removes multiple items' do
    subject.add_items(dish,5)
    expect {subject.remove_items(dish,-4)}.to change{subject.items.count}.by(-4)
    expect(subject.items).to eq([dish])
  end

  it 'calculates a total' do
    subject.add_items(dish,5)
    expect(subject.total).to eq(5*6)
  end


end