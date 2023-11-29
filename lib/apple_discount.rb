class AppleDiscount < BaseDiscount
  CODE = "AP1"

  def perform(items:)
    apples = apples(items: items)
    if apples.size >= 3
      resource(CODE).merge!(price: 4.5)
    end
    super
  end

  private

  def apples(items:)
    items.select{ |h| h == CODE}
  end
end
