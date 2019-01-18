require 'menu'

describe Menu do
   let(:item_fish)       { double(:item, name: "fish") }
   let(:item_class)  { double(:item_class, new: item_fish) }
   let(:subject)     { Menu.new(["fish"], item_class)}

  it 'should initialize with a list of item names' do
    expect(subject.names).to eq ["fish"]
  end

  it 'should create items on initialization' do
    expect(subject.items).to eq [item_fish]
  end

  # it 'should return a list of items' do
  #   expect(subject.list_items).to eq ["fish", "pizza", "pasta", "cake"]
  # end
end
