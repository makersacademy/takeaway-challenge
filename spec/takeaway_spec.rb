require_relative '../lib/takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order, sms: sms)}

  let(:menu) { double(:menu) }
  let(:print) { double(:print_menu) }
  let(:order) { double(:order) }
  let(:sms) { double(:sms) }
  
  it 'instantiates the class with three arguments' do
    expect(takeaway).to be_an_instance_of(Takeaway)
  end

end