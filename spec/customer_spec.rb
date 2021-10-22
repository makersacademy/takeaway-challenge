require 'customer'

describe Customer do 

  describe '#menu' do

    let(:menu_list) { [{ Jalfreezi: 5, Korma: 4, Chiken_Tikka_Masala: 5.5,
      Pilau_Rice: 1.5, Egg_Fried_Rice: 1.2 }] 
    }

    it 'checks that the customer can retrieve a menu' do

      restraunt_double = double(:menu, menu: menu_list)
      customer = Customer.new(restraunt_double)
      expect(customer.retrieve_menu).to eq menu_list

    end 
    
  end 

  describe '#order_selection' do 
    
    it 'checks we can add a order' do
      restraunt_double = double(:add_order, add_to_order: { Jalfreezi: 5 }) 
      customer = Customer.new(restraunt_double)
      expect(customer.order_selection(:Jalfreezi)).to eq [Jalfreezi: 5]
    end 

  end 

  describe '#order_total' do 

    it 'gets order total' do 
      restraunt_double = double(:add_order, add_to_order: { Jalfreezi: 5 }, order_price: 5, order_items: { Jalfreezi: 5 }) 
      customer = Customer.new(restraunt_double)
      customer.order_selection(:Jalfreezi)
      expect(customer.order_total).to eq 5
    end 

  end 

  describe '#order_complete' do 

    it 'checks we can complete a order' do 
      time = Time.now
      time += 3600
      time_check = "Your order has been processed and is expected to arrive by: #{time.strftime("%H:%M%p")}"
      restraunt_double = double(:add_order, add_to_order: { Jalfreezi: 5 }, complete_order: time_check) 
      customer = Customer.new(restraunt_double)
      customer.order_selection(:Jalfreezi)
      expect(customer.order_complete("false_number")).to eq time_check
    end 

  end 

end 
