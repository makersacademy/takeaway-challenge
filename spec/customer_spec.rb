require 'customer'

describe Customer do 

  it 'show display a list of dishes with prices' do 
    subject = Customer.new
    list_of_dishes = subject.dish_list
    expect(subject.dish_list).to eq list_of_dishes
  end 

  it 'should allow selection of several available dishes' do 
    subject = Customer.new
    subject.select_dish("Mac&Cheese")
    subject.select_dish("Pasta")
    expect(subject.select_dish("Pasta")).to eq ["Mac&Cheese", "Pasta", "Pasta"]
  end 

  it 'check that the total matches the sum of the various dishes order' do
    subject = Customer.new 
    subject.select_dish("Mac&Cheese")
    subject.select_dish("Pasta")
    subject.select_dish("Mac&Cheese")
    subject.select_dish("Pasta")
    expect(subject.amount).to eq 18
  end 
end 