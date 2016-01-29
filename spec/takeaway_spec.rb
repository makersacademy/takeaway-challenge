require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}

  it 'return list of dishes with pricea' do
    expect(takeaway.see_menu).to be_an_instance_of(Array)
  end

  it 'return order with dish name and 1x (if not specified)' do
    expect(takeaway.order('dish')).to eq '1x dish(s)'
  end

  it 'return order with dish name and quantity' do
    expect(takeaway.order('dish',2)).to eq '2x dish(s)'
  end

end