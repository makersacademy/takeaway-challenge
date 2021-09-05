require 'menu'
require 'dish'

describe Menu do
  it { is_expected.to be_kind_of(described_class) }
  it { is_expected.to respond_to(:add_to_menu).with(1).argument }

  let(:dish1) { Dish.new("Hash brown", 0.99) }
  let(:dish2) { Dish.new("Cup of tea", 0.99) }

  it 'add dish to menu' do
    subject.add_to_menu(dish1)
    subject.add_to_menu(dish2)
    expect(subject.list_of_dishes).to eq([dish1.itemise, dish2.itemise])
  end
  #how to override my default menu in testing??

  it 'displays menu' do
    subject.add_to_menu(dish1)
    subject.add_to_menu(dish2)
    expect(subject.view_menu).to eq("TD-Dish: #{dish1.name} // Price: £#{dish1.price}\nTD-Dish: #{dish2.name} // Price: £#{dish2.price}")
  end
end
