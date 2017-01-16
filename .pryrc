require "./lib/takeaway.rb"

pepperoni = Dish.new(:name => "Pepperoni pizza", :price => 7.00)
hawaiian = Dish.new(:name => "Hawaiian pizza", :price => 9.00)
meat_feast = Dish.new(:name => "Meat Feast pizza", :price => 8.00)

menu = Menu.new(pepperoni, hawaiian, meat_feast)

takeaway = Takeaway.new(:menu => menu,
                        :printer_module => ArrayPrinter,
                        :order_class => Order,
                        :order_total_checker => OrderTotalChecker,
                        :sms_messager => SMSMessager,
                        :twilio_client => TwilioClient)
