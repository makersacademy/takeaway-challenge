require 'takeaway'

describe Takeaway do
  let(:takeaway) { described_class.new('Beef & Beer') }
  let(:interface) { double(:interface, class: Interface) }

  it 'instantiates a new takeaway' do
    expect(takeaway).to be_an_instance_of Takeaway
  end

  it 'Upon instantiation it has an interface' do
    expect(takeaway.interface).to be_an_instance_of Interface
  end

  # describe '#confirm' do
  #   it 'puts out a message to STDOUT confirming order placed' do
  #     expect{ takeaway.confirm }.to output("Your order has been placed\n").to_stdout
  #   end
  # end
end
