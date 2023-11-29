class FtDiscount < BaseDiscount
  CODE = 'FR1'

  def perform(items:)
    items_updated = super
    final_items(items: items_updated)
  end

  private

  def final_items(items:)
    items.group_by { |item| item[:code] }
     .values
     .flat_map do |group|
        if group[0][:code] == CODE
          group.take(1)
        else
          group
        end
      end
  end
end
