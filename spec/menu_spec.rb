require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  it 'contains a list of menu items' do
    expect(subject.menu).to(be_a(Hash))
  end

end
