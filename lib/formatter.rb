module Formatter

  def three_col_str(str1, str2, str3)
    str1.ljust(10) + str2.ljust(10) + str3.rjust(6) + "\n"
  end

  def pound_str(float)
    sprintf('£%.2f', float)
  end

end
