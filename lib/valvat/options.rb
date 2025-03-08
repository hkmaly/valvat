# frozen_string_literal: true

require_relative 'configuration'

class Valvat
  class Options
    DEPRECATED_KEYS = {
      requester_vat: :requester,
      savon: :http
    }.freeze

    def initialize(options, silence = false)
      @options = options || {}

      DEPRECATED_KEYS.each do |deprecated, key|
        if @options.key?(deprecated)
          puts "DEPRECATED: The option :#{deprecated} is deprecated. Use :#{key} instead." unless silence
          @options[key] ||= @options[deprecated]
        end
      end

      check_uk_key(silence)
    end

    def [](key)
      @options.key?(key) ? @options[key] : Valvat.config[key]
    end

    def dig_r(hash, *list)
      key = list.shift
      value = hash[key]
      return value unless value
      list.empty? ? value : dig_r(value, *list)
    end

    def dig(*keys)
      dig_r(@options, *keys).nil? ? Valvat.config.dig(*keys) : dig_r(@options, *keys)
    end

    private

    def check_uk_key(silence)
      return if @options[:uk] != true || silence

      puts 'DEPRECATED: The option :uk is not allowed to be set to `true` anymore. ' \
           'Instead it needs to be set to your HMRC API authentication credentials.'
    end
  end

  def self.Options(options)
    options.is_a?(Valvat::Options) ? options : Valvat::Options.new(options)
  end
end
