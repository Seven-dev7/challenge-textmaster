require_relative '../lib/base_discount.rb'
require_relative '../lib/apple_discount.rb'

describe AppleDiscount do
  let(:subject) { described_class }

  describe '#perfomr' do
    context 'initailize' do
      it do
        expect(subject).to eq(AppleDiscount)
      end
    end

    context 'A basket with 3 apples' do
      let(:data) do
        [
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
      end

      let(:items) do
        [
          'AP1',
          'AP1',
          'FR1',
          'AP1'
        ]
      end

      let(:result) { 16.61 }

      it 'returns an Array' do
        instance =subject.new(data: data)
        perform = instance.perform(items: items)

        expect(perform.class)
          .to eq(Array)
      end

      it 'contains 3 apples with price at 4.50' do
        instance =subject.new(data: data)
        perform = instance.perform(items: items)

        expect(perform.select {|h| h[:price] == 4.5}.size)
          .to eq(3)
      end

      it 'returns a sum equal to result (16.61)' do
        instance =subject.new(data: data)
        perform = instance.perform(items: items)
        price_items_result = perform
          .map {|h| h[:price]}.sum

        expect(price_items_result).to eq(result)
      end
    end
  end
end
