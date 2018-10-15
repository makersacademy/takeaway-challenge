require 'menu'

describe Menu do
  # let(:entry_station) { double :station }
  # let(:exit_station) { double :station }
  let(:order) { double :order, total => "Total: £8.98" }

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
    expect(subject).to respond_to(:select)
  end

  it 'adds dish to order and returns the added dish' do
    expect(subject.select("pizza", 2)).to eq "Added 2 pizza(s) to your order"
  end

  it 'checks dish is on the menu' do
    expect(subject.select("fish")).to eq "Please select an item from the menu."
  end

  it 'returns the order total' do
    subject.select("pizza")
    subject.select("burger")
    expect(subject.total).to eq "Total: £8.98"
  end

end
