require 'takeaway'

describe Takeaway do

  subject { described_class.new }
  let(:menu) { double(:menu)}
  let(:dishes) { {'Burger': '4.50'} }

  it 'should show a list of dishes and prices' do
    allow(subject).to receive(:menu_list).and_return(dishes)
    subject.menu_list
    expect(subject.menu_list).to eq(dishes)
  end

end
