require 'simplecov'
SimpleCov.start do
  add_filter 'test/' # Tests should not be checked for coverage.
end

require "minitest"
require "minitest/autorun"
require "minitest/reporters"

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

# require_relative your lib files here!
require_relative '../lib/reservation'
# require_relative '../lib/passenger'
# require_relative '../lib/trip'
# require_relative '../lib/trip_dispatcher'
# require_relative '../lib/driver'
