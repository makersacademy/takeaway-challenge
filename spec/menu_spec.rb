require 'menu'

describe Menu do
  subject(:menu) {described_class.new}

  it 'returns list with dishes and prices' do
    expect(menu.list[:Lamb][:Price]).to eq 2.00
  end
end
