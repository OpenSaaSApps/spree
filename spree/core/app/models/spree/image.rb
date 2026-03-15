# Backward compatibility — all logic now lives in Spree::Asset.
# Spree::Image is kept as a subclass that sets media_type to 'image' by default.
# This class will be removed in Spree 6.0.
module Spree
  class Image < Asset
    self.inheritance_column = nil

    after_initialize do
      self.media_type ||= 'image'
    end
  end
end
