require './takeaway'

describe 'takeaway' do
  
  it 'prints a list of dishes with prices' do
    dishes = Dishes.new
    expect(dishes.print(dishes)).not_to eq nil
  end

end