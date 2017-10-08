require 'menu'

describe Menu do

  it 'contains tapas hash on initialization' do
    expect(subject.tapas).to include("GORDAL OLIVES")
  end

  it 'print_menu prints the whole menu' do
    expect(subject.print_menu).to include("ARROZ NEGRO")
  end
end
