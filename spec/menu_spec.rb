require "menu"

describe Menu do 

  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do 
    { korma: 8.00,
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
end
