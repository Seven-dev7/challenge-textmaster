class Checkout
  def initialize(price_rules)
    @price_rules = price_rules
    @items = []
    @items_discounted = []
  end

  def scan(item)
    @items << item
  end

  def total
    apply_rules
  end

  private

  def apply_rules
    if @items.map{|h| h == 'AP1'}.size >= 3
      discount = @price_rules[1].perform(items: @items)
    end
    discount = @price_rules[0].perform(items: @items)

    discount.map {|h| h[:price]}.sum
  end
end
