require 'test_helper'

module Props
  class IntegerPropTest < Minitest::Test

    def test_takes_fixnum
      assert Humidifier::Props::IntegerProp.new.valid?(1)
    end

    def test_rejects_other_values
      refute Humidifier::Props::IntegerProp.new.valid?(Object.new)
      refute Humidifier::Props::IntegerProp.new.valid?([])
      refute Humidifier::Props::IntegerProp.new.valid?({})
      refute Humidifier::Props::IntegerProp.new.valid?(1.0)
    end

    def test_convert_valid
      assert_equal 5, Humidifier::Props::IntegerProp.new.convert(5)
    end

    def test_convert_invalid
      out, err = capture_io do
        assert_equal 6, Humidifier::Props::IntegerProp.new('Test').convert('6')
      end
      assert_match /WARNING: Property test/, out
    end
  end
end
