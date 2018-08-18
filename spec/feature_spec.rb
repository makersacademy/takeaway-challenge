describe 'Takeaway feature tests' do

  it 'shows a list of dishes with prices' do
    given_that_there_are_some_dishes
    # the_dishes_can_be_added_to_a_menu
    # the_menu_can_be_viewed
  end

  def given_that_there_are_some_dishes
    expect(Dish).to respond_to(:new).with(2).arguments
  end

end
