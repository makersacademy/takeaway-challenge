require 'customer' 

describe 'Customer' do 

  let(:customer){Customer.new(:klass=> order_class, :name=>'Julian', :number=>'07500456388', :customer_order=>customer_order)}
  
  let(:order_class){double :order_class, :new=>customer_order}  
  let(:customer_order){double :order, :order_detail=>[{:dish => :pizza, :item_count => 3}],:order_total_cost=>90, :test_customer_order=>""}
  
  let(:menu){double :menu, :dishes=>[]}
  let(:assistant){double :assistant}

  it 'klass object to be the klass variable' do
    expect(customer.klass).to be(order_class)
  end  

  it 'can have an order' do
    p customer_order.order_detail
  end  

  it 'customer_order is an object' do
    expect(customer_order).to be_a(Object)  
  end

  #why respond to doesnt work?
  it 'customer_order will respond to test_customer_order method' do
    expect(customer_order.test_customer_order).to eq("")  
  end  

end  