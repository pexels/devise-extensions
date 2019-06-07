# frozen_string_literal: true

require_relative "compatibility/active_record_patch"

module Devise
  module Models
    # These compatibility modules define methods used by devise-extensions
    # that may need to be defined or re-defined for compatibility between ORMs
    # and/or older versions of ORMs.
    module Compatibility
      extend ActiveSupport::Concern
      include Devise::Models::Compatibility::ActiveRecordPatch
    end
  end
end
