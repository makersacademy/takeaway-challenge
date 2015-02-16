require 'customer'

describe 'Customer' do 
  let(:customer){Customer.new}
  let(:order){double :order}
  let(:customer_with_klass){Customer.new(:klass=>order)}  


  it 'should have a name and a number' do
    expect(customer).to respond_to(:name, :number)
  end  

  it 'klass instance variable should be an object by default' do 
    expect(customer.klass).to be_a(Object)
  end  

  it 'klass object to be the order class when customer is instantiated with a klass attribute' do
    expect(customer_with_klass.klass).to be_a(order)
  end  



end  