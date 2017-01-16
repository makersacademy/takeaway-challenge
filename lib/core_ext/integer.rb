class Integer
  def to_pounds_and_pence
    pounds      = self.to_s[0..-3]
    pence       = self.to_s[-2..-1] || ""
    pounds = "0" if pounds == ""
    pence = ("00" + pence)[-2..-1]
    "£#{pounds}.#{pence}"
  end
end
