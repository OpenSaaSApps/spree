class AddProductMediaSupport < ActiveRecord::Migration[7.2]
  def change
    create_table :spree_variant_media do |t|
      t.references :variant, null: false
      t.references :asset, null: false
      t.integer :position
      t.timestamps
    end

    add_index :spree_variant_media, [:variant_id, :asset_id], unique: true,
              name: 'index_spree_variant_media_on_variant_and_asset'
    add_index :spree_variant_media, [:variant_id, :position],
              name: 'index_spree_variant_media_on_variant_and_position'

    add_column :spree_assets, :media_type, :string
    add_column :spree_assets, :focal_point_x, :decimal, precision: 5, scale: 4
    add_column :spree_assets, :focal_point_y, :decimal, precision: 5, scale: 4
    add_column :spree_assets, :external_video_url, :string

    add_index :spree_assets, :media_type
  end
end
