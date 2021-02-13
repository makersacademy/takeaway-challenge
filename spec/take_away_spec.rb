require 'take_away'

describe TakeAway do 
  
  let(:dishes) { double :Dishes, pierogi: 11.99 }
  let(:menu) { double :Menu, dishes: dishes }  
  subject { described_class.new(menu) }

  it 'displays a list of all available dishes' do 
    expect(subject.read_menu).to eq dishes
  end
  
end 
