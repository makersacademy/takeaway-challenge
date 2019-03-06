require 'menu'

describe Menu do

subject(:menu) { Menu.new }

it 'shows menu in alphabatical order' do
  expect(menu.read).to eq ({
    :four_cheese => 12,
    :garlic_bread=>5,
    :margherita=>8,
    :romana=>10,
    :seafood=>14
    })
  end

  it 'prints out dish with price' do
    allow(menu).to receive(:read).and_return({:margherita=>8})
    expect do
      menu.print
    end.to output("margherita £8\n").to_stdout
  end
end
