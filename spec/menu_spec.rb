require 'menu'

describe Menu do
  it 'begins with an empty list of dishes' do
    expect(subject.dishes).to be_empty
  end
  let(:dish) { double "dish", :name => "garlic bread", :price => 3.95 }
  it 'allows dishes to be added' do
    subject.add(dish)
    expect(subject.dishes).to include(dish)
  end
  it 'prints the menu' do
    subject.add(dish)
    expect(subject.dishes).to eq([dish])
  end
  it 'allows you to save a dish for future use' do
    subject.add(dish)
    subject.save
    subject.load
    expect(subject.dishes).to include(dish)
  end
  it 'allows you to load a past menu' do
    subject.load("irb_menu.csv")
    expect(subject.dishes).not_to be_empty
  end
  it 'lists menu items with their names and prices' do
    subject.load("irb_menu.csv")
    subject.list
  end
end
