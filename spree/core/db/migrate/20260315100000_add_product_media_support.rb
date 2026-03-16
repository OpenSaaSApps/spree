class AddProductMediaSupport < ActiveRecord::Migration[7.2]
  def change
    add_column :spree_assets, :media_type, :string
    add_column :spree_assets, :focal_point_x, :decimal, precision: 5, scale: 4
    add_column :spree_assets, :focal_point_y, :decimal, precision: 5, scale: 4
    add_column :spree_assets, :external_video_url, :string

    add_index :spree_assets, :media_type
  end
end
