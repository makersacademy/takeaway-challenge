require 'order'

describe Order do
  let(:dish1)   { double('Dish', name: 'Guacamole Deep', price: 269) }
  let(:dish2)   { double('Dish', name: 'Not Yo Cheese', price: 399) }
  let(:dishes)  { [dish1, dish2] }
  let(:menu)    { double('Menu', dishes: dishes) }

  it { should respond_to(:add).with(3).arguments }
  
  it 'should allow you to select/store items from a menu' do
    subject.add(menu, 1, 1)
    expect(subject.basket).to include(dish1)
  end
     
  it 'should return an itemised total' do
    subject.add(menu,1,1)
    subject.add(menu,2,1)
    expect { subject.total }.to output("1 x Guacamole Deep @ £2.69\n1 x Not Yo Cheese @ £3.99\nTOTAL: £6.68\n").to_stdout
  end
end