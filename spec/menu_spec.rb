require 'menu'

describe Menu do
  let(:menu) {described_class.new}


  it 'returns a list of dishes' do
    expect(menu.list).to be_a Hash
  end

  it 'returns a list of dishes' do
    expect(menu.list).to include("Naan" => 2.00)
  end


end
