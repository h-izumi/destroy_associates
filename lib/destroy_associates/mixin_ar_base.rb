module DestroyAssociates
  module MixinARBase
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def destroy_associates_if_blank(assocs, attr)
        before_save do
          send(assocs).each do |assoc|
            assoc.mark_for_destruction if assoc.send(attr).blank?
          end
        end
      end
    end
  end
end
