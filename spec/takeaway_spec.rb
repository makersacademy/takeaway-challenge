require 'takeaway'

describe Takeaway do

  it 'should show a list of dishes and prices' do
    expect(subject.menu_list).to eq(subject.menu.dishes)
  end

end
