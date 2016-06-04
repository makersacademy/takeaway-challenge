require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  it { is_expected.to respond_to :open}
  # it 'opens the menu'
  # expect(menu).to respond_to(:open)
end
