# frozen_string_literal: true

# checks what the user input
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

  def first_check_first(user_input, this)
    case user_input
    when 'exit' then this.print_out.close
    when 'cancel' then this.asking_for_item = false
    when 'checkout' then this.checkout?
    else second_check_first(user_input, this)
    end
  end

  def second_check_first(user_input, this)
    if menu?(this.new_order, this.print_out, this.user_input)
      this.print_out.oops
    else
      this.quantity(user_input)
      this.asking_for_item = false
    end
  end

  def first_check_second(item, user_input, this)
    case user_input
    when 'exit' then this.print_out.close
    when 'cancel' then this.asking_for_quantity = false
    when '0', '' then this.print_out.you_entered_zero
    else second_check_second(item, user_input, this)
    end
  end

  def second_check_second(item, user_input, this)
    if not_a_no?(user_input)
      this.print_out.oops
    else
      this.add(item, user_input.to_i)
      this.asking_for_quantity = false
    end
  end

  def first_check_third(user_input, this)
    case user_input
    when 'exit' then this.print_out.close
    when 'cancel' then this.asking_for_mobile_no = false
    else second_check_third(user_input, this)
    end
  end

  def second_check_third(user_input, this)
    if mobile?(user_input)
      this.print_out.oops
    else
      this.new_order.checkout(user_input.to_i)
      this.print_out.close
    end
  end
end
