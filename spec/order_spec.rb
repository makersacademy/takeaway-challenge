require 'order'

describe Order do

  let(:menu) { Menu.new }
  subject(:order) { described_class.new(menu) }

  it 'saves order items to list' do
    subject.add('chips', 2)
    expect(subject.item_list).to eq({ 'chips' => 2 })
  end

  it 'calculates order total' do
    subject.add('vegan fishcake', 2)
    subject.calculate_total
    expect(subject.total).to eq(5)
  end

end 
