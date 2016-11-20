require 'takeaway.rb'

describe TakeAway do

  it 'should respond to view_menu' do
    expect(takeaway).to respond_to(:view_menu)
  end


end
