require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env)

module Brewhaha
  class Application < Rails::Application
    
    #   g.test_framework :rspec,
    #     :fixtures => true,
    #     :view_specs => false,
    #     :helper_specs => false,
    #     :routing_specs => true,
    #     :controller_specs => true,
    #     :request_specs => true
    #   g.factory_girl dir: 'spec/factories'
    # end
  end
end
