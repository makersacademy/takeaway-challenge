require 'menu'

describe Menu do
  it 'begins with an empty list of dishes' do
    expect(subject.dishes).to be_empty
  end
#  it 'lists available dishes' do
#    expect(subject.dishes).not_to be_nil
#  end
  let(:dish) { double "dish" }
  it 'allows dishes to be added' do
    subject.add(dish)
    expect(subject.dishes).to include(dish)
  end
  it 'prints the menu' do
    subject.add(dish)
    expect(subject.dishes).to eq([dish])
  end
end
