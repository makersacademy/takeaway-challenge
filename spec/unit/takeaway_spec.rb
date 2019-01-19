require 'takeaway'

RSpec.describe Takeaway do

  it 'lets you add an order' do
    expect(subject.order('Vegetable pie', 1)).to eq [{"Vegetable pie"=>1}]
  end

end
