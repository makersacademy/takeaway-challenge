require 'menu'

describe Menu do
  let(:dish_1) { double(:dish_1, name: 'Foo soup', price: 2) }
  let(:dish_2) { double(:dish_2, name: 'Bar stew', price: 6) }
  subject(:subject) { described_class.new([dish_1, dish_2])}
  it 'lists available dishes' do
    expect { subject.list }.to output("Foo soup: 2\nBar stew: 6\n" ).to_stdout
  end
  it 'checks if a dish name is on the menu' do
    expect(subject.contains?('Bar stew')).to be(true)
  end
  it 'returns false if a dish name is not on the menu' do
    expect(subject.contains?('Foobar ramen')).to be(false)
  end
  it 'can return a dish by name' do
    expect(subject.dish_from_name('Bar stew')).to eq(dish_2)
  end
  it 'returns nothing if dish not on menu' do
    expect(subject.dish_from_name('Foobar minestrone')).to be_nil
  end
end
