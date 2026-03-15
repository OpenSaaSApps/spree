module Spree
  class VariantMedia < Spree.base_class
    self.table_name = 'spree_variant_media'

    acts_as_list scope: :variant

    belongs_to :variant, class_name: 'Spree::Variant', touch: true
    belongs_to :asset, class_name: 'Spree::Asset', touch: true

    validates :variant, :asset, presence: true
    validates :asset_id, uniqueness: { scope: :variant_id }
  end
end
