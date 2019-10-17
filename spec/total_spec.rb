require 'total'
describe Total do
  it 'can calculate a total' do
    dishes = {'name' => 0.00, 'curry' => 2.20, 'pizza' => 5.00}
    items ='pizza, curry, pizza'
    expect(subject.calculate(items, dishes)).to eq ("pizza = 5.0 curry = 2.2 pizza = 5.0 total = £12.2")
  end
end
