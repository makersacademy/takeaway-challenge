require './lib/take_away'

describe 'feature test' do

  it 'allows take-away to be ordered and verification sent' do
    t = TakeAway.new
    t.show_menu
    t.order_dish("rice", 2)
    t.order_dish("rice", 1)
    t.order_dish("sushi set", 4)
    t.order_dish("takoyaki", 1)
    #t.order_dish("nuggets", 6)
    t.query_price('rice')
    t.show_total
    t.check_order("£59.60")
    t.confirm_order('yes')

  end

end
