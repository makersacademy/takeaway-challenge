require_relative '../lib/menu'

describe Menu do
  it { is_expected.to be_a Menu }
  it { is_expected.to respond_to :view }
  it { expect(subject.view).to be_a Hash}
end

describe Menu do
  let(:menu) { Menu.new }
end
