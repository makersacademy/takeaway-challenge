require 'menu'

describe Menu do
  let(:dish1) { double('Dish', name: 'Guacamole Deep', price: 269) }
  let(:dish2) { double('Dish', name: 'Not Yo Cheese', price: 399) }
  it { should respond_to(:add).with(1).argument }

  it 'should return a list of dishes and their prices' do
    subject.add(dish1)
    subject.add(dish2)
    puts'**********'
    puts dish1.name
    expect { subject.view }.to output("1. Guacamole Deep - £2.69\n2. Not Yo Cheese - £3.99\n").to_stdout
  end

end