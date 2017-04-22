require 'takeaway'

describe Takeaway do

  subject(:cafe) {described_class.new(Menu)}
  let( :menu ) { double :menu }

  it 'pulls a menu from the Menu class' do
    expect(cafe.menu).to eq({:pizza => 2.99, :thai => 4.55, :mexican => 5.25})
  end



end
