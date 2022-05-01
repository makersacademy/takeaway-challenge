describe 'integration test' do
  xit 'should not raise error' do
    expect {
      takeaway = Takeaway.new
      takeaway.display_menu
      takeaway.add_to_order({pizza: 9.50})
      takeaway.check_order
      takeaway.place_order
    }.not_to raise_error
  end
end