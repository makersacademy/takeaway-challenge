require 'takeaway'

describe Takeaway do
  it 'lists available dishes and their prices' do
    expect(subject.dishes).to eq("Hamburger: £1, Pizza: £2")
  end
end
