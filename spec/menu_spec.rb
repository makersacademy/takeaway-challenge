require 'menu'

describe Menu do
  let(:dish1) { double('Dish', name: 'Guacamole Deep', price: 269) }
  let(:dish2) { double('Dish', name: 'Not Yo Cheese', price: 399) }
  it { should respond_to(:add).with(1).argument }

  context 'given a menu with two dishes added' do
    before(:each) {
      subject.add(dish1)
      subject.add(dish2)
    }
    it 'should return a list of dishes and their prices' do
      expect { subject.view }.to output("1. Guacamole Deep - £2.69\n2. Not Yo Cheese - £3.99\n").to_stdout
    end
  
    it 'should allow me to select items' do
      subject.select(1, 2)
      expect(subject.selection).to eq([{item: 1, name: 'Guacamole Deep', qty: 2, unit_cost: 269, price: 538}])
    end
  end
end
