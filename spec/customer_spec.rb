require 'customer' 

describe 'Customer' do 
  let(:customer){Customer.new}
  let(:customer_with_instantiation){Customer.new(:klass=>order, :name=>'Julian', :number=>'07500456388')}  
  
  let(:order){double :order, :name=>:order}

  it 'klass object to be the order class when customer is instantiated with a klass attribute' do
    expect(customer_with_instantiation.klass).to be_a(order)
  end  
    
end  