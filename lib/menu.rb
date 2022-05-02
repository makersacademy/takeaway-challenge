class Menu

MENU =  {
  "Sesame Prawn Toast:": 5.80,
  "Spare Ribs in Honey Sauce:": 6.20,
  "Siu Mai:": 4.00,
  "Singapore Style Vermicelli:": 6.40,
  "Chicken & Cashewnuts:": 6.60,
  "Salt & Pepper Squid:": 7.20,
  "Salt & Pepper Tofu:": 6.30,
  "Salt & Pepper Chips:": 3.00
}
# MENU.each { |item, price| puts "#{item}   £#{price.to_f}"}

def intialize
  @menu = MENU
end

end