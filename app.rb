require 'pry'
require_relative 'lib/checkout1.rb'
require_relative 'lib/rules.rb'
require_relative 'lib/ceo.rb'
require_relative 'lib/coo.rb'

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
  Ceo.new(data).perform(basket:),
  Coo.new(data).perform(basket:)
]
co1 = Checkout1.new(price_rules)
basket.each do |v|
  item = data.find { |h| h[:code] == v }
  co1.scan(item)
end
total = co1.total
p total
