class Checks

  def basket?(new_order)
    new_order.order.empty?
  end

  def menu?(new_order, print_out, user_input)
    !new_order.menu.items.include?(print_out.match_menu_format(user_input))
  end

  def mobile?(user_input)
    not_eleven?(user_input) || not_a_no?(user_input)
  end

  def not_eleven?(user_input)
    user_input.length != 11
  end

  def not_a_no?(user_input)
    (user_input =~ /\D/) != nil
  end

  def order_a(new_order)
    new_order.show unless basket?(new_order)
  end

  def order_b(new_order, print_out)
    print_out.checkout unless basket?(new_order)
  end
end
