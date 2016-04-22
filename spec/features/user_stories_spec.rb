#user_stories_spec.rb

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

# 2.2.3 :001 > t = TakeAway.new
#  => #<TakeAway:0x007f975b1a39a8 @menu=#<Menu:0x007f975b1a3890 @dishes={"spring roll"=>0.99, "char sui bun"=>3.99, "pork dumpling"=>2.99, "peking duck"=>7.99, "fu-king fried rice"=>5.99}>, @basket={}, @text_provider=#<TwilioAPI:0x007f975b1a33e0>>
# 2.2.3 :002 > t.read_menu
#  => {"spring roll"=>0.99, "char sui bun"=>3.99, "pork dumpling"=>2.99, "peking duck"=>7.99, "fu-king fried rice"=>5.99}
# 2.2.3 :003 > t.order 'spring roll'
#  => "1x spring roll(s) added to your basket."
# 2.2.3 :004 > t.order 'spring roll'
#  => "1x spring roll(s) added to your basket."
# 2.2.3 :005 > t.order 'spring roll', 4
#  => "4x spring roll(s) added to your basket."
# 2.2.3 :006 > t.basket_summary
#  => "spring roll x4 = £3.96"
# 2.2.3 :007 > t.add 'pork dumpling', 3
#  => "3x pork dumpling(s) added to your basket."
# 2.2.3 :008 > t.basket_summary
#  => "spring roll x4 = £3.96, pork dumpling x3 = £8.97"
# 2.2.3 :009 > t.total
#  => "Total: £12.93"
# 2.2.3 :010 > c.checkout(12.93)