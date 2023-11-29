
require 'pry'
require_relative 'lib/checkout.rb'
require_relative 'lib/base_discount.rb'
require_relative 'lib/ft_discount.rb'
require_relative 'lib/apple_discount.rb'

data = [
  {
    code: 'FR1',
    name: 'Fruit tea',
    price: 3.11,
  },
  {
    code: 'AP1',
    name: 'Apple',
    price: 5.00
  },
  {
    code: 'CF1',
    name: 'Coffee',
    price: 11.23
  }
]

basket = ['FR1', 'AP1', 'FR1', 'CF1'] # 19.34
basket2 = ['FR1', 'FR1'] # 3.11
basket3 = [ 'AP1', 'AP1', 'FR1', 'AP1'] # 16.61

price_rules = [
  FtDiscount.new(data: data),
  AppleDiscount.new(data: data)
]
co = Checkout.new(price_rules)
basket.each do |item|
  co.scan(item)
end
total = co.total
p total
