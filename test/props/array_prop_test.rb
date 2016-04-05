require 'test_helper'

module Props
  class ArrayPropTest < Minitest::Test

    def test_takes_array
      assert build.valid?(%w[one two three])
    end

    def test_rejects_other_values
      refute build.valid?(Object.new)
      refute build.valid?(['one', 'two', 3])
    end

    private

      def build
        AwsCF::Props::ArrayProp.new(key: 'MyTestKey', spec: 'String')
      end
  end
end
