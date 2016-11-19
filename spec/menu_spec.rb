require 'menu'

describe Menu do
  subject(:menu) {described_class.new}

  it 'should initialize with a list hash' do
    expect(menu.list).to be_instance_of Hash
  end

end
