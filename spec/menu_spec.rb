require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  it 'lists dishes with prices' do
    expect(menu.list_dishes).to eq({ :chicken => 6.50, :beef => 8.20, :seafood => 10.50 })
  end

end
