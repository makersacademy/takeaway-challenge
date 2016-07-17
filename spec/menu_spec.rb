require './lib/menu'

describe Menu do
  let(:subject) {described_class.new}
  it { is_expected.to respond_to(:print_menu) }
end
