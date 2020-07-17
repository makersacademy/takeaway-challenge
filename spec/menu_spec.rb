require_relative '../lib/menu'

describe Menu do
  it { is_expected.to be_a Menu }
  it { expect(subject).to respond_to :options }
  it { expect(subject.options).to be_a Hash}
end

describe Menu do
  let(:display) { Menu.new.display }
  it { expect(display).to be_an_instance_of Hash}
end
