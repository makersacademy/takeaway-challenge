require 'menu'

describe Menu do

 it 'it has a list of dishes' do
   expect(subject.dishes).to be_a_kind_of(Array)
 end

  it 'can list all of the dishes' do
    expect{subject.list}.to output(
<<-menu
1. Mushroom Pizza -- £9
2. American Hot Pizza -- £11.5
3. Salsiaccia Pizza -- £10.5
4. Truffle Pizza -- £11
5. Chorizo Arancini -- £6.5
6. Veg Arancini -- £5.5
7. Tiramusi -- £5
8. Peroni -- £3
9. Nastro Azzuro -- £3
menu
    ).to_stdout
  end

end