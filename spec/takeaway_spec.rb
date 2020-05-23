require 'takeaway'

describe Takeaway do
  subject { Takeaway.new }

  it 'check if a new takeaway project is an istance of Takeaway class' do
    expect(subject).to be_an_instance_of Takeaway
  end

  it 'check see a list of dishes with prices' do
    expect(subject.menu).to eq("Rice: 2.00£")
  end
end
