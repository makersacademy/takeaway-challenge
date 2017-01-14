describe 'Takeaway' do

  it 'should allow my customer to see a list of dishes with prices' do
    takeaway = Menu.new
    expect { takeaway.see_dishes }.not_to raise_error
  end
  
end
