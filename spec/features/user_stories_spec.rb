describe 'User Stories' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'so customer can see a list of dishes with prices' do
    takeaway = Takeaway.new
    expect(takeaway.see_menu).to be_an_instance_of(Array)
  end


  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'so customer can order dish from menu' do
    takeaway = Takeaway.new
    expect(takeaway.order('dish')).to eq '1x dish(s)'
  end

  it 'so customer can order some number of dishes from menu' do
    takeaway = Takeaway.new
    expect(takeaway.order('dish',2)).to eq '2x dish(s)'
  end

end