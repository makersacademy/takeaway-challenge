require 'menu'

describe Menu do
   let(:item_fish)   { double(:item ) }
   let(:item_class)  { double(:item_class, new: item_fish) }
   let(:formatter)    { double(:formatter, format_items: "Fish --- 8") }
   let(:formatter_class)   { double(:formatter_class, new: formatter) }
   let(:subject)     { Menu.new(["fish"], item_class, formatter_class)}

  it 'should initialize with a list of item names' do
    expect(subject.names).to eq ["fish"]
  end

  it 'should create items on initialization' do
    expect(subject.items).to eq [item_fish]
  end

  it 'should run formatter' do
    expect(formatter).to receive(:format_items)
    subject.print_menu
  end

  it 'should return a formatted menu' do
    expect(subject.print_menu).to eq "Fish --- 8"
  end
end
