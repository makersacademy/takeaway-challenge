require 'menu'

describe Menu do
  subject(:menu) {described_class.new}
  let(:list) {double :list}
  it 'creates menu' do
    expect(menu.list).not_to be_empty
  end

end
