require 'json'
require 'rest-client'

module UniSender
  URL = 'http://api.unisender.com'

  class Client
    attr_accessor :api_key, :locale

    def initialize(api_key, locale = nil)
      self.api_key = api_key

      if locale.is_a?(Hash)
        puts "Deprecated: Initializer changed. Use UniSender::Client.new(api_key, [locale])"
        locale = locale[:locale]
      end
      self.locale = locale if locale
    end

    def locale
      @locale || 'en'
    end

    private

    def method_missing(method_name, *args, &block)
      params = (args.first.is_a?(Hash) ? args.first : {} )
      default_request(prepare_action_name(method_name), params)
    end

    def prepare_action_name(source)
      parts = source.to_s.scan(/[[:alnum:]]+/)
      camelize = lambda { |word, first| (first ? word[0].chr.downcase : word[0].chr.upcase) + word[1..-1] }

      action_name = parts.each_with_index.map { |part, i| camelize.call(part, i.zero?) }.join('')
      raise NoAction if action_name.empty?
      action_name
    end

    def default_request(action, params)
      params.merge!(:api_key => api_key, :format => :json)
      url = "#{ URL }/#{ locale }/api/#{ action }"
      JSON.parse RestClient.post(url, params)
    end
  end

  class NoAction < ::StandardError
  end
end
