require 'takeaway'

describe 'User stories' do

  # 1 User Story
  #As a customer
  #So that I can check if I want to order something
  #I would like to see a list of dishes with prices
  it 'see a list of dishes with prices ' do
    takeaway = Takeaway.new
    expect(takeaway.display_menu).to eq ('{"chicken"=>3, "rice"=>1, "pizza"=>6, "chips"=>2}')
  end


end
