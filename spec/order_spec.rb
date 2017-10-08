require 'order'

def new_order
  $stdin.gets.chomp
end

describe Order do

  it 'contains @order on initialization' do
    expect(subject.order).to eq([])
  end

  describe 'see_menu' do

    it 'Show the customer the menu' do
      expect(subject.see_menu).to eq({
        "GORDAL OLIVES" => 6.75,
        "GAZPATCHO" => 6.00,
        "CROQUESTAS DE JAMON" => 7.00,
        "SELECCION DE IBERICOS" => 23.00,
        "SELECTION DE QUESO" => 16.75,
        "TORTIALLA ESPANOLA" => 5.00,
        "HUEVIS ROTAS" => 8.75,
        "PATATAS BRAVAS" => 5.00,
        "GAMBAS AL AJILLO" => 9.75,
        "ARROZ NEGRO" => 7.00
      })
    end
    # it 'new_order asks for an item' do
      # expect {subject.new_order}.to output("Enter the item you would like: \n").to_stdout
    # end
  end
  describe 'order_item' do

    before do
      $stdin = StringIO.new("GAZPATCHO")
    end

    after do
      $stdin = STDIN
    end

    it 'takes order_item and adds the item and price to @order' do
      subject.order_item
      expect(subject.order).to eq([{ "GAZPATCHO" => 6.00 }])
    end
  end

  describe 'view_order' do

    before do
      $stdin = StringIO.new("GAZPATCHO")
    end

    after do
      $stdin = STDIN
    end

    it 'takes view_order and returns the list of item and their prices' do
      o = Order.new
      o.order_item
      expect { o.view_order }.to output(" GAZPATCHO   6.0 \n\n").to_stdout
    end
  end

  describe 'order_total' do

    before do
      $stdin = StringIO.new("GAZPATCHO")
    end

    after do
      $stdin = STDIN
    end

    it 'prints the cost of the order' do
      o = Order.new
      o.order_item
      expect { o.order_total }.to output("Your total price is £6.0\n").to_stdout
    end
  end

end
