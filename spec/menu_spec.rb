require 'menu.rb'

describe Menu do
  subject(:menu) { described_class.new}

  let(:list) do
    {"curry" => 1.00, "xcurry" => 1.00}
  end

  it 'is initialized with a list of dishes' do
    expect(menu.list).to include list
  end

end
