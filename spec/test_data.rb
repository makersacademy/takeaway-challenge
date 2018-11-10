class TestData
  attr_reader :menu_data
  attr_reader :expected_menu_print_output
  attr_reader :menu_data_pence
  attr_reader :expected_menu_print_output_pence

  @@menu_data = [ { id: 1, name: 'Chicken Korma', description: 'Mild cream based curry', price: 599 },
                           { id: 2, name: 'Vindaloo', description: 'Very hot curry', price: 699 },
                           { id: 3, name: 'Tikka', description: 'Dry curry', price: 499 } ]

 @@expected_menu_print_output = "1: Chicken Korma £5.99\n" +
                                "   Mild cream based curry\n" +
                                "2: Vindaloo £6.99\n" +
                                "   Very hot curry\n" +
                                "3: Tikka £4.99\n" +
                                "   Dry curry\n"

  @@menu_data_pence = [ { id: 1, name: 'Chicken Korma', description: 'Mild cream based curry', price: 69 },
                    { id: 2, name: 'Vindaloo', description: 'Very hot curry', price: 79 },
                    { id: 3, name: 'Tikka', description: 'Dry curry', price: 99 } ]

  @@expected_menu_print_output_pence = "1: Chicken Korma £00.69\n" +
                                       "   Mild cream based curry\n" +
                                       "2: Vindaloo £00.79\n" +
                                       "   Very hot curry\n" +
                                       "3: Tikka £00.99\n" +
                                       "   Dry curry\n"

  @@expected_order_print_output = "Your Order is:\n" +
                                   "--------------\n" +
                                   "Tikka £4.99\n" +
                                   "Vindaloo £6.99\n" +
                                   "--------------\n\n" +
                                   "Total: £11.98"

  def self.expected_order_print_output
   @@expected_order_print_output
  end
  def self.menu_data
    @@menu_data
  end

  def self.expected_menu_print_output
    @@expected_menu_print_output
  end

  def self.menu_data_pence
    @@menu_data_pence
  end

  def self.expected_menu_print_output_pence
    @@expected_menu_print_output_pence
  end
end
