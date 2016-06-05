describe TakeAway do

  it {is_expected.to respond_to(:show_menu)}
  
  it ':order accepts total as one argument and an array of dishes/quantity' do 

      expect { TakeAway.order(44, [[3,5], [2,1]]) }.not_to raise_error

  end 

end 
