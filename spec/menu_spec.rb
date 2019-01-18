require 'menu'

describe Menu do

subject(:menu) { Menu.new }

context 'contains information on dishes and price' do
  it 'does pizza' do
    expect(menu.food[:pizza]).to eq 8
  end

  it 'does pasta' do
    expect(menu.food[:pasta]).to eq 7
  end
end

context 'list dish with price' do
  it { is_expected.to respond_to :print}

  it "shows pizza £8, pasta £7" do
    expect(menu.print).to eq "pizza £8, pasta £7"
  end
end
end
