require 'takeaway'

describe Takeaway do

  

  it 'should show a list of dishes and prices' do
    expect(subject.menu_list).to eq(subject.menu.dishes)
  end

  it 'can add a dish and quantity to the order' do
    subject.add('Hot dog', 1)
    expect(subject.order).to include({item: 'Hot dog', qty: 1})
  end

  it 'should not allow a non menu item to be added to the order' do
    expect {subject.add('Fruit', 1)}.to raise_error 'Thats not on the menu!'
  end

end
