require 'takeaway'

describe TakeAway do

  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double(:menu) }

describe '#initialize' do
  it 'instantiates a new takeaway' do
    expect(takeaway).to eq takeaway
  end

  it 'initializes it with a menu object' do
    #allow(takeaway).to receive(:print_menu).and_return(menu)
    #What is actually going on here?
    expect(takeaway.print_menu).to eq(menu)
  end
 end

  it 'can read a menu' do
    expect(subject.menu). to eq(menu)
  end
end
