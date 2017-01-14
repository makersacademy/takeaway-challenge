describe 'Takeaway' do

  it 'should allow my customer to see a list of dishes with prices' do
    takeaway = Menu.new
    expect { takeaway.see_dishes }.not_to raise_error
  end

  it 'should allow my customer to select any number of available dishes' do
    takeaway = Menu.new
    expect { takeaway.select_dishes('Margherita Pizza') }.not_to raise_error
    expect { takeaway.select_dishes('Spaghetti Carbonara', 'Calzone') }.not_to raise_error
  end

end
