class Checkout1
  attr_reader :values

  def initialize(price_rules)
    @price_rules = price_rules
    @items = []
    @values = []
  end

  def scan(item)
    @items << item
  end

  def total
    fruit_tea
    apple
    coffee
    @values.sum
  end

  private

  def fruit_tea
    if resource_count(code: 'FR1') >= 2
      @values << @items.select{ |h| h[:code] == 'FR1'}
        .map { |h| h[:price] }
        .uniq.sum
    else
      @values << @items.select{ |h| h[:code] == 'FR1'}
        .map {|h| h[:price] }
        .sum
    end
  end

  def apple
    if resource_count(code: 'AP1') >= 3
      apples = @items.select { |h| h[:code] == 'AP1'}
      new_apples = apples.map do |h|
        h.merge!(price: 4.5)
      end
      @values << new_apples.map{|h| h[:price]}.sum
    else
      @values << @items.select{|h| h[:code] == 'AP1'}
       .map {|h| h[:price] }
       .sum
    end
  end

  def coffee
    @values << @items.select{ |h| h[:code] == 'CF1'}
      .map {|h| h[:price]}
      .sum
  end

  def resource_count(code:)
    @items.select {|h| h[:code] == code}
      .size
  end
end
