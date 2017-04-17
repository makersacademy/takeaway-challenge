require 'menu'
describe Menu do
  subject(:menu) { described_class.new }

  context '#read_menu' do
    it { is_expected.to respond_to :read_menu }
  end
end
