require 'menu'

describe Menu do
  let(:dish) { double('Dish') }

  it 'should return a list of dishes and their prices' do
    expect { subject.view }.to output(  "1. Guacamole Deep - £2.69
2. Not Yo Cheese - £3.99
3. Jalapeno Business - £4.50
4. Taco Shellebration - £6.99
5. In Queso Emergency - £5.99
6. Tequila Mockingbird - £7.50\n").to_stdout
  end

  it 'should allow me to add new items' do
    subject.add(dish)
    expect(subject.dishes).to include(dish)
  end

  it 'should allow me to select items' do
    subject.add(dish)
    subject.select(7, 2)
    expect(subject.selection).to eq([dish, dish])
  end
end
