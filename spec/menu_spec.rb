require 'menu'
describe Menu do

  it 'initializes with an empty basket' do
    expect(subject.basket).to be_empty
  end

  it 'can print the whole menu' do
    expect(subject.print_menu).to eq subject.list
  end

  it 'can store objects in the basket' do
    subject.order(2)
    expect(subject.basket[0]).to eq subject.list[1]
  end

  it "can remove objects from the basket" do
    subject.order(1)
    subject.remove(1)
    expect(subject.basket).to be_empty
  end

  it 'raises an error if a nonexistant item is selected to remove from basket' do
    expect { subject.remove(100) }.to raise_error 'Please enter the number of the item you wish to remove'
  end

  it 'can store multiple items in a basket' do
    subject.order(2)
    subject.order(5)
    subject.order(2)
    expect(subject.basket.count).to eq 3
  end

  it 'calculates the total price of the basket' do
    subject.order(2)
    subject.order(5)
    subject.order(2)
    expect(subject.total).to eq 24
  end

  it 'shows the user their full order' do
    subject.order(2)
    expect { subject.print_basket }.to output("Your basket:\nCheese burger ----- £9\nTotal: £9\n").to_stdout
  end
end
