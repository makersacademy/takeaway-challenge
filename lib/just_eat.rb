require_relative './order_menu'
require 'dotenv'

Dotenv.load

OrderMenu.new.interactive_menu
