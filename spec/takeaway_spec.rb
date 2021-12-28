require 'takeaway'

describe Takeaway do
  subject { described_class.new }

  it 'shows the menu' do
    expect(subject.menu).to eq({ Nigiri: "£3.00" })
  end 
end
