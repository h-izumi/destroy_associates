require "active_record"

require "destroy_associates/version"
require "destroy_associates/mixin_ar_base"

ActiveRecord::Base.send :include, DestroyAssociates::MixinARBase
