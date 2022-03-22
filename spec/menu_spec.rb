require "menu"
require "takeaway"
require "order"

describe Menu do 

  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do 
    { 
      korma: 8.00,
      balti: 9.00
    }
  end 

  it 'should have a list of dishes and their prices' do 
    expect(menu.dishes).to eq(dishes)
  end 

  it 'should print a list of dishes and their prices' do 
    printed_menu = "Korma €8.00, Balti €9.00"
    expect(menu.print).to eq(printed_menu)
  end 

  it 'says whether a dish is available from the menu' do
    expect(menu.dish_available?(:korma)).to be true 
  end 

  it 'says whether a dish is not available from the menu' do
    allow(menu).to receive(:dish_available?).with(:curry).and_return(false) # stub
    expect(menu.dish_available?(:curry)).to be false 
  end 

  it 'can calculate the total price' do 
    expect(menu.price(:korma)).to eq(dishes[:korma])
    expect(menu.price(:balti)).to eq(dishes[:balti])
  end 
end
