require 'rspec'
require 'menu'

describe Menu do

  let(:a) { double :dish, order_code: 'A2', description: 'Pork', price: 380 }
  let(:b) { double :dish, order_code: 'B4', description: 'Beef', price: 490 }
  let(:dish_list) { double :dish_list, list: [a, b] }
  let(:menu) { described_class.new dish_list }

  it 'contains a list of the available items' do
    expect(menu.items.count).to eq 2
  end

  it 'displays the available dishes' do
    expect { menu.show_menu }.to output.to_stdout
  end

end
