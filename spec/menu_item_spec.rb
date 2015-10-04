require 'menu_item'

describe Menu_item do




  it 'initialize raises error when missing menu name and price' do
    expect{described_class.new()}.to raise_error(ArgumentError)
  end

  it 'has a name' do
    curry = Menu_item.new("curry", 5)
    expect(curry.name).to eql("curry")
  end

  it 'has a price' do
    curry = Menu_item.new("curry", 5)
    expect(curry.price).to eql(5)
  end






end
