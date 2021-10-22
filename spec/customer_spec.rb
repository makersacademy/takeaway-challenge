require 'customer'

describe Customer do 

  it 'show display a list of dishes with prices' do 
    subject = Customer.new
    list_of_dishes = subject.dishes
    expect(subject.dishes).to eq list_of_dishes
  end 

  # it 'should allow selection of several available dishes' do 
  #   subject = Customer.new 
  #   subject.select_dish("Mac & Cheese")
  #   subject.select_dish("Pasta")
  #   expect(subject.select_dish("Pasta")).to eq ["Mac & Cheese", "Pasta", "Pasta"]
  # end 

  # it 'check that the total matches the sum of the various dishes order' do

  # end 
end 