require 'menu'

describe Menu do
  it 'checks method list_dishes exists' do
    expect(subject).to respond_to(:list_dishes)
  end

  # it 'method list_dishes returns nil' do
  #   expect(subject.list_dishes).to eq nil
  # end

  it 'expects list_dishes to return list' do
    expect(subject.list_dishes).to eq "1. Item: pizza, Price £5.99\n2. Item: chips, Price £1.99\n3. Item: burger, Price £2.99\n4. Item: kebab, Price £3.99\n"
  end

  it 'checks method select_dish exists' do
    expect(subject).to respond_to(:select_dish)
  end

  it 'adds dish to order and returns the added dish' do
    expect(subject.select_dish("pizza")).to eq "Added 1 pizza to your order"
  end

end
