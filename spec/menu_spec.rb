require 'menu'

describe Menu do

  it 'contains a list of pizzas with prices' do
    expect(subject.list).to eq({margherita: 5, pepperoni: 6, hawaiian: 6, supreme: 7})
  end

  it 'allows to choose one or more of the same pizzas' do
    expect(subject).to respond_to(:choose).with(2).arguments
  end

  it 'stores the choice the right number of times' do
    subject.choose(2, "margherita")
    expect(subject.ordered).to eq({margherita: 2})
  end

  it 'raises an error if the selected pizza is not in the list' do
    expect{subject.choose(1, "banana")}.to raise_error "Your choice is not on the menu"
  end


end
