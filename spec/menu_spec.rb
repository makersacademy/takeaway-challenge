require './lib/menu.rb'

describe Menu do

  it 'instantiates the class' do
    expect(subject).to be_an_instance_of(Menu)
  end

  it 'initializes an empty menu list' do
    expect(subject.menu).to be_empty
  end

  let (:dish){ DishesList.new("Salad", 4) }

  it 'adds the dishes to the menu' do
    subject.add(dish)
    expect(subject.menu).not_to be_empty
 end

end
