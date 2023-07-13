# frozen_string_literal: true

require 'rspec'

require "#{File.dirname(__FILE__)}/../lib/valvat.rb"
require 'webmock/rspec'
WebMock.allow_net_connect!

RSpec.configure do |config|
  config.mock_with :rspec
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
end

I18n.enforce_available_locales = false if defined?(I18n)
