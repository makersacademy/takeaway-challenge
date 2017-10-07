require 'menu'

describe Menu do

  it 'contains tapas hash on initialization' do
    expect(subject.tapas).to include("Gordal Olives")
  end

  it 'contains alcoholc_drinks hash on initialization' do
    expect(subject.alcoholc_drinks).to include("Cava Sangria")
  end

  it 'contains dessert hash on initialization' do
    expect(subject.dessert).to include("Crema Catalana")
  end

  it 'print_menu prints the whole menu' do
    expect(subject.print_menu).to include("Arroz con Leche")
  end
end
