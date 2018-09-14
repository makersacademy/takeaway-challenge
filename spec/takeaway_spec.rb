require './lib/takeaway'

describe Takeaway do
  let(:menu2) {menu2 = {:"1.fish_and_chips" => '£3.20', :"2.burger_and_chips" => '£4.20', :"3.chips" => '£1'}}
  it 'to responds to calling menu' do
    expect(subject).to respond_to(:menu)
  end
  it 'to be able to see the menu' do
    expect(subject.menu).to eq(menu2)
  end
  it 'to responds to calling add_meal' do  
    expect(subject).to respond_to(:add_meal)
  end
end
