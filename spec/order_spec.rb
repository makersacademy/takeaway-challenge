require 'order'

describe Order do

  it 'contains @order on initialization' do
    expect(subject.order).to eq({})
  end

  it 'asks the customer if they would like to see a menu?' do
    expect(subject.see_menu).to include("Arroz con Leche")
  end

  it 'asks for an item' do
    expect {subject.new_order}.to output("Enter the section of the menu you would like to chose from: \n").to_stdout
  end
end
