require 'order'

RSpec.describe Order do
  let(:menu) { double(:menu, select: ['Pizza ai quattro formaggi', 9])} 
  
  it 'has 0 items in @meals' do 
    expect(subject.meals.length).to be_zero
  end

  it 'can add an item to @meals' do 
    expect{ subject.add(menu.select) }.to change {subject.meals.length}.by(1)
  end
end