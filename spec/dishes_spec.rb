require '/Users/admin/Library/Mobile Documents/com~apple~CloudDocs/takeaway-challenge/takeaway-challenge/docs/dishes.rb'

describe Dishes do

  subject(:dishes) { described_class.new(dish_list) }

  let(:dish_list) do 
    { 
      burger: 10.00, 
      chips: 2.00, 
    }
  end

  it 'has a list of dishes and their prices' do
    expect(dishes.dish_list).to eq(dish_list)
      
  end

  it 'prints a list of dishes with name and prices' do
    printed_menu = 'burger £10.00, chips £2.00'
    expect(dishes.print_dishes).to eq(printed_menu)
  end

end



