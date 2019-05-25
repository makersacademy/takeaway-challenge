require 'order'

describe Order do
  let(:dish1)       { double('Dish', name: 'Guacamole Deep', price: 269) }
  let(:dish2)       { double('Dish', name: 'Not Yo Cheese', price: 399) }
  let(:dishes)      { [dish1, dish2] }
  let(:selection)   { [{item: 1, name: 'Guacamole Deep', qty: 1, unit_cost: 269, price: 269}, {item: 2, name: 'Not Yo Cheese', qty: 1, unit_cost: 399, price: 399}]}
  let(:menu)    { double('Menu', dishes: dishes, selection: selection) }

  it { should respond_to(:add_to_basket).with(1).argument }
     
  it 'should return an itemised total' do
    subject.add_to_basket(menu)
    expect { subject.view }.to output("ORDER SUMMARY\n-------------\n1 x Guacamole Deep @ £2.69 : £2.69\n1 x Not Yo Cheese @ £3.99 : £3.99\n-------------\nTOTAL: £6.68\n").to_stdout
  end

  it { should respond_to(:pay).with(1).argument }

  it 'should raise error if basket total is different from selection' do
    subject.add_to_basket(menu)
    expect { subject.pay }.not_to raise_error
  end
end
