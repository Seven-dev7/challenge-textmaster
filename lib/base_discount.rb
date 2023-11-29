class BaseDiscount
  def initialize(data:)
    @data = data
  end

  def perform(items: nil)
    raise if items.nil?

    items_updated(items: items)
  end

  private

  def items_updated(items:)
    items.map do |code|
      resource(code)
    end
  end

  def resource(code)
    @data.find {|h| h[:code] == code}
  end
end
