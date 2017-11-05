require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  it '.list return a list of dishes with prices' do
    expect(menu).to respond_to(:list)
  end

  it '.list return a hash' do
    expect(menu.list).to be_instance_of(Hash)
  end

end
