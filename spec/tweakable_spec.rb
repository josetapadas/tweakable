require 'tweakable'

describe Tweakable do
    it "is able to configure a specific class" do
      class SampleClass
        include Tweakable.with(:string, :number)
      end

      SampleClass.configure do |config|
        config.string = "hello"
        config.number = 7
      end

      expect(SampleClass.config.string).to eql("hello")
      expect(SampleClass.config.number).to eql(7)
    end
end