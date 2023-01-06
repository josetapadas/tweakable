# frozen_string_literal: true

require "minitest/autorun"
require_relative "../lib/tweakable"

describe Tweakable do
    it "can tweak a simple class to provide a configuration block" do
        class MySampleClass
            include Tweakable.with(:prop1, :prop2)
        end

        MySampleClass.configure do |config|
            config.prop1 = "prop1"
            config.prop2 = 2
        end

        assert MySampleClass.config.prop1 == "prop1"
        assert MySampleClass.config.prop2 == 2
    end
end
