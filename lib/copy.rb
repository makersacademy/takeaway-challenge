module Copy

  def spacer
    puts "".center(20,'-')
  end

  def prompt
    print "> "
  end

  def welcome
    puts """
                             _________
               r==           |       |
            _  //            |  M.A. |   ))))
           |_)//(''''':      |       |
             //  \\_____:_____.-------D     )))))
            //   | ===  |   /        \\
        .:'//.   \\ \\=|   \\ /  .:'':./    )))))
       :' // ':   \\ \\ ''..'--:'-.. ':
       '. '' .'    \\:.....:--'.-'' .'
        ':..:'                ':..:'

                  Welcome to

              M  A  K  E  R  O  O

                       ~

      Fastest Nigerian Food Delivery in Town

    """
  end

  def options
    spacer
    puts "\nPlease enter a number:\n\n\t1) Add a Dish to your Meal\n\t7) Remove a Dish from your Meal\n\t8) Meal Summary and Cost\n\t9) Confirm and place your order\n\t0) Exit\n\n"
    prompt
  end

  def apology
    spacer
    puts "I didn't catch that. Hit return to go back to the main menu."
    prompt
    gets
  end

  def add_dish_prompt
    puts "\nEnter a number to add the corresponding dish to your meal."
    prompt
  end

  def dishes_header
    spacer
    puts "\nDishes: \n\n"
  end

  def order_summary_header
    spacer
    puts "Your order: \n"
    spacer
    puts
  end

  def order_summary_total
    puts
    spacer
    print "Total Cost: "
  end

  def y_confirmation(phone)
    spacer
    puts "Your text message confirmation will be sent to #{phone}."
    puts "\nPlease enter Y to confirm your order."
    prompt
  end

  def ask_for_phone_number
    puts "\nPlease enter your phone number for text message confirmation:"
    prompt
  end

  def empty_basket_warning
    spacer
    puts "Your basket is empty!"
  end

  def confirmed_order
    spacer
    puts "Order confirmed.\nYou'll receive a confirmation text with your approximate delivery time shortly.\nSee you again soon!\nFor now, hit return to go back to the main menu."
    prompt
    gets
  end

  def select_a_dish_to_remove
    puts "\nEnter a number to remove the corresponding items from your meal."
    prompt
  end

end
