require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  it '.list return a list of dishes with prices' do
    expect(menu).to respond_to(:list)
  end

  it '.list return a hash' do
    expect(menu.list).to be_instance_of(Hash)
  end

  it '#pretty_print return a string' do
    expect(menu.pretty_print).to be_instance_of(String)
  end

  it '#to_currency change a number to currency' do
    expect(menu.to_currency(5)).to eq("£5.00")
  end

end
