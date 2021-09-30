require 'menu'

describe Menu do

 it 'it has a list of dishes' do
   expect(subject.dishes).to be_a_kind_of(Array)
 end

  it 'can list all of the dishes' do
    expect{subject.list}.to output(
<<-menu
Mushroom Pizza -- £9
American Hot Pizza -- £11.5
Salsiaccia Pizza -- £10.5
Truffle Pizza -- £11
Chorizo Arancini -- £6.5
Veg Arancini -- £5.5
Tiramusi -- £5
Peroni -- £3
Nastro Azzuro -- £3
menu
    ).to_stdout
  end

end