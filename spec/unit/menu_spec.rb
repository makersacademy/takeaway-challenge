require 'menu'

describe Menu do

  subject(:menu) { described_class.new }
  it 'should implement this interface' do
    expect(subject).to respond_to(:add_dish).with(2).arguments
    expect(subject).to respond_to(:list)
  end

  it 'should add a dish to the menu' do
    subject.add_dish('Pie', 1)
    expect(subject.items['Pie']).to eq 1
  end

  it 'should add another dish to the menu' do
    subject.add_dish('Sausage', 1)
    expect(subject.items['Sausage']).to eq 1
  end

  it 'should provide a menu' do
    subject.add_dish('Pie', 1)
    subject.add_dish('Mash', 2)
    subject.add_dish('Sausage', 3)
    expect(subject.items.count).to eq 3
  end

  it 'should list a menu to stdout' do
    subject.add_dish('Pie', 1)
    subject.add_dish('Mash', 2)
    subject.add_dish('Sausage', 3)
    allow($stdout).to receive(:write)
    subject.list
    expect { subject.list }.to output('Pie: £1 Mash: £2 Sausage: £3 ').to_stdout
  end
end
