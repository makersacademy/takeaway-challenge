require 'customer' 

describe 'Customer' do 

  let(:customer){Customer.new(:klass=> order_class, :name=>'Julian', :number=>'07500456388', :customer_order=>{:order_detail=>[{:dish => :pizza, :item_count => 3},{:dish=>:burger,:item_count=>4}],:order_total_cost=>250})}
  
  let(:order_class){double :order_class, :new=>customer_order, :test_customer_order=>"Sorry"}  
  let(:customer_order){double :order, :order_detail=>[{:dish => :pizza, :item_count => 3}],:order_total_cost=>90}
  
  let(:menu){double :menu, :dishes=>[]}
  let(:assistant){double :assistant}

  it 'klass object to be the order class' do
    expect(customer.klass).to be(order_class)
  end  

  it 'can have and order' do  
    expect(customer.customer_order).to include(:order_detail, :order_total_cost)
  end  

  it 'can confirm an order' do
    p customer.confirm_order(assistant)
    expect{customer.confirm_order(assistant)}.to raise_error(RuntimeError, "Sorry you inputted the wrong total cost, please try again.") 
  end  



end  