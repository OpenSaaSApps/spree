FactoryBot.define do
  factory :variant_media, class: Spree::VariantMedia do
    association :variant
    association :asset, factory: :image
  end
end
