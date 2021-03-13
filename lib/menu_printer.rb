class MenuPrinter
  DIVIDER_LEN = 50

  def print_divider_line(divider_symbol, divider_len = DIVIDER_LEN)
    puts divider_symbol * divider_len
  end

  def print_content_line(content)
    puts content
  end
end