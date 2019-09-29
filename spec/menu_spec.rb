require 'menu'
describe Menu do

  it 'initializes with an empty selection array' do
    expect(subject.selection).to be_empty
  end

  it 'can print the whole menu' do
    expect(subject.print_menu).to eq subject.list
  end

  it 'can store objects in the selection array' do
    subject.order(2)
    expect(subject.selection[0]).to eq subject.list[1]
  end

  it 'raises an error if a nonexistant item is selected' do
    expect{subject.order(100)}.to raise_error 'Item not recognised'
  end

  it 'can store multiple items in a  selection' do
    subject.order(2)
    subject.order(5)
    subject.order(2)
    expect(subject.selection.count).to eq 3
  end

  it 'calculates the total price of the selection' do
    subject.order(2)
    subject.order(5)
    subject.order(2)
    expect(subject.total).to eq 21
  end
end
