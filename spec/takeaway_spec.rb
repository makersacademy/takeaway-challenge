require 'takeaway'

describe Takeaway do
  let(:takeaway) {described_class.new}
  let(:interface) { double(:interface, class: Interface) }

  it 'instantiates a new takeaway' do
    expect(takeaway).to be_an_instance_of Takeaway
  end

  it 'Upon instantiation it has an interface' do
    expect(takeaway.interface).to be_an_instance_of Interface
  end
end
