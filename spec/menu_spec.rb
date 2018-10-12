require 'menu'

describe Menu do
  it 'check method list_dishes exists' do
    expect(subject).to respond_to(:list_dishes)
  end

  # it 'method list_dishes returns nil' do
  #   expect(subject.list_dishes).to eq nil
  # end

  it 'expects list_dishes to return list' do
    expect(subject.list_dishes).to eq "Item: pizza, Price £5.99\nItem: chips, Price £1.99\nItem: burger, Price £2.99\nItem: kebab, Price £3.99\n"
  end
end
