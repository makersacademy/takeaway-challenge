require 'order'

describe Order do
  let(:dish1)       { double('Dish', name: 'Guacamole Deep', price: 269) }
  let(:dish2)       { double('Dish', name: 'Not Yo Cheese', price: 399) }
  let(:dishes)      { [dish1, dish2] }
  let(:selection)   { dishes }
  let(:menu)    { double('Menu', dishes: dishes, selection: selection) }

  it { should respond_to(:add_to_basket).with(1).argument }
     
  it 'should return an itemised total' do
    subject.add_to_basket(menu)
    expect { subject.view }.to output("ORDER SUMMARY
-------------
1 x Guacamole Deep @ £2.69 each
1 x Not Yo Cheese @ £3.99 each
-------------
TOTAL: £6.68\n").to_stdout
  end

  it { should respond_to(:pay).with(1).argument }

  it 'should raise error if basket total is different from selection' do
    subject.add_to_basket(menu)
    expect { subject.pay(700) }.to raise_error("Please amend your payment. Incorrect amount tendered.")
  end
end
