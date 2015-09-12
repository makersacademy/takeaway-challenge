require 'menu_item'

describe Menu_item do



  it 'initialize raises error when missing menu name and price' do
    expect{described_class.new()}.to raise_error(ArgumentError)
  end




end
