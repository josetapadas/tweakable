# frozen_string_literal: true

require_relative "tweakable/version"

module Tweakable
  def self.with(*attrs)
    tinkerer_class = Class.new do
      attr_accessor *attrs
    end

    tweaker_methods = Module.new do
      define_method :config do
        @config ||= tinkerer_class.new
      end

      def configure
        yield config
      end
    end

    Module.new do
      singleton_class.send :define_method, :included do |host_class|
        host_class.extend tweaker_methods
      end
    end
  end
end