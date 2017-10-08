require 'order'

  def new_order
    $stdin.gets.chomp
  end

describe Order do
  before do
    $stdin = StringIO.new("GAZPATCHO")
  end

  after do
    $stdin = STDIN
  end
  
  it 'contains @order on initialization' do
    expect(subject.order).to eq([])
  end

  it 'Show the customer the menu' do
    expect(subject.see_menu).to eq({
      "GORDAL OLIVES" => 6.75,
      "GAZPATCHO" => 6.00,
      "CROQUESTAS DE JAMON" => 7.00,
      "SELECCION DE IBERICOS" => 23.00,
      "SELECTION DE QUESO" => 16.75,
      "TORTIALLA ESPANOLA" => 5.00,
      "HUEVIS ROTOTS" => 8.75,
      "PATATA BRAVAS" => 5.00,
      "GAMBAS AL AJILLO" => 9.75,
      "ARROZ NEGRO" => 7.00
    })
  end

  # it 'new_order asks for an item' do
    # expect {subject.new_order}.to output("Enter the item you would like: \n").to_stdout
  # end

  it 'takes new_order and adds the item and price to @order' do
    # before do
    #   $stdin = StringIO.new("GAZPATCHO")
    # end
    #
    # after do
    #   $stdin = STDIN
    # end

    subject.new_order
    expect(subject.order).to eq([{"GAZPATCHO" => 6.00}])
  end
end
