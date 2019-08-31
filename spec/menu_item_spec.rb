require './lib/menu_item'

describe MenuItem do
  subject { MenuItem.new('Cafe Latte', '1') }

  it 'uses - conjoiner by default' do
    expect(subject.to_string).to eq 'Cafe Latte - 1'
  end

  it 'can use custom conjoiner' do
    expect(subject.to_string('*')).to eq 'Cafe Latte * 1'
  end
end