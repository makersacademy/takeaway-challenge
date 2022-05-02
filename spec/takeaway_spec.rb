require 'takeaway'
require 'menu'

describe TakeAway do

  it 'can create an instance of the class' do
    expect(subject).to be_kind_of(TakeAway)
  end 

  it 'can display a menu' do
    expect(subject.view_menu).to be_kind_of(String)
  end

  let(:menu){ {"Prawn Toast": 6.5}}
  it 'adds items to the basket' do

    item = menu["Prawn Toast"]
    subject.select(item)
    expect(subject.basket).to eq [item]
  end
end