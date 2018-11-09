require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:menu) { double() }

  it 'can show menu (list of dishes with prices)' do
    expect{ takeaway.show_menu }.to output(/Our menu/).to_stdout
  end
end
