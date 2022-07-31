require_relative '../lib/take_away'
require_relative '../lib/order'

describe TakeAway do
  t1 = TakeAway.new({ 'Fried chicken': 5.00, 'Morning glory': 3.50, 'Pork neck salad': 7.50, 'Jasmine rice': 2.00 })
  t2 = TakeAway.new({ 'Battered cod': 9.00, 'Chunky chips': 3.50, 'Mushy peas': 1.50 })
  t3 = TakeAway.new({ 'Lamb kofte': 11.00, 'Falafel wrap': 5.50, 'Sesame humous': 2.00 })
  t4 = TakeAway.new({ 'Beef pho': 8.00, 'Soft shell crab': 9.50, 'Tofu pho': 6.00 })
  it 'allows access to the menu' do
    expect(t1.menu.display).to eq ['Fried chicken, £5.00', 'Morning glory, £3.50', 'Pork neck salad, £7.50', 'Jasmine rice, £2.00']
  end

  it 'raises an error if the choice is not on the menu' do
    expect { t1.choose('Fried rice') }.to raise_error("That dish isn't on the menu!")
  end
  
  it 'adds dishes to the list of choices, if on the menu and not yet chosen' do
    expect { t1.choose('Fried chicken', 2) }.to change { t1.list_of_choices.length }.by(1)
  end

  it 'increases the quantity of the selection by the appropriate amount if on the menu and has has already been selected' do
    t2.choose('Chunky chips', 4)
    expect { t2.choose('Chunky chips', 2) }.to change { t2.list_of_choices[0][:portions] }.by(2)
  end

  it 'clears choices when instructed' do
    t3.choose('Falafel wrap')
    expect { t3.start_over }.to change { t3.list_of_choices.length }.by(-1)
  end

  it 'raises and error when #finalise is called and the list of choices is empty' do
    expect { t4.finalise }.to raise_error("You haven't chosen anything yet..")
  end
  
  it 'creates an order when instructed' do
    t4.choose('Soft shell crab', 4)
    expect(t4.finalise).to be_an_instance_of(Order)
  end
end
