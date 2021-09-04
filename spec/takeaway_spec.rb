require 'takeaway.rb'

describe Takeaway_menu do 
  it 'has a list of items avaliable' do
  expect{subject.to respond_to(menu_hash)}
  end 
end 