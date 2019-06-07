# frozen_string_literal: true

module DeviseExtensions
  class Engine < ::Rails::Engine
    ActiveSupport.on_load(:action_controller) do
      include DeviseExtensions::Controllers::Helpers
    end
  end
end
