require 'date'
require 'forwardable'

require 'timeliness/helpers'
require 'timeliness/format_set'
require 'timeliness/parser'
require 'timeliness/version'

module Timeliness
  class << self
    extend Forwardable
    def_delegators Parser, :parse, :add_formats, :remove_formats, :remove_us_formats
    attr_accessor :default_timezone, :dummy_date_for_time_type, :ambiguous_year_threshold
  end

  # Default timezone
  @default_timezone = :utc

  # Set the dummy date part for a time type values.
  @dummy_date_for_time_type = [ 2000, 1, 1 ]

  # Set the threshold value for a two digit year to be considered last century
  #
  # Default: 30
  #
  #   Example:
  #     year = '29' is considered 2029
  #     year = '30' is considered 1930
  #
  @ambiguous_year_threshold = 30
end
