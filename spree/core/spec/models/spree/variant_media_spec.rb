require 'spec_helper'

RSpec.describe Spree::VariantMedia, type: :model do
  let(:product) { create(:product) }
  let(:variant) { create(:variant, product: product) }
  let(:image) { create(:image, viewable: product.master) }

  describe 'associations' do
    it 'belongs to variant' do
      variant_media = build(:variant_media, variant: variant, asset: image)
      expect(variant_media.variant).to eq(variant)
    end

    it 'belongs to asset' do
      variant_media = build(:variant_media, variant: variant, asset: image)
      expect(variant_media.asset).to eq(image)
    end
  end

  describe 'validations' do
    it 'requires variant' do
      variant_media = build(:variant_media, variant: nil, asset: image)
      expect(variant_media).not_to be_valid
    end

    it 'requires asset' do
      variant_media = build(:variant_media, variant: variant, asset: nil)
      expect(variant_media).not_to be_valid
    end

    it 'prevents duplicate variant-asset pairs' do
      create(:variant_media, variant: variant, asset: image)
      duplicate = build(:variant_media, variant: variant, asset: image)
      expect(duplicate).not_to be_valid
    end

    it 'allows same asset on different variants' do
      other_variant = create(:variant, product: product)
      create(:variant_media, variant: variant, asset: image)
      other = build(:variant_media, variant: other_variant, asset: image)
      expect(other).to be_valid
    end
  end

  describe 'acts_as_list' do
    it 'auto-assigns position scoped to variant' do
      image2 = create(:image, viewable: product.master)
      vm1 = create(:variant_media, variant: variant, asset: image)
      vm2 = create(:variant_media, variant: variant, asset: image2)

      expect(vm1.position).to eq(1)
      expect(vm2.position).to eq(2)
    end
  end
end
