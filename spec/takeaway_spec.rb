require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  #let(:menu) { double :menu }

  it 'can display a menu' do
    expect(takeaway.read_menu).to include({ "chips" => 1.00 })
  end


end
