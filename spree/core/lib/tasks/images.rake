namespace :spree do
  namespace :images do
    desc 'Backfill thumbnail_id for all variants and products'
    task backfill_thumbnails: :environment do
      puts 'Backfilling variant thumbnails...'
      Spree::Variant.where(thumbnail_id: nil).where.not(media_count: 0).find_each do |variant|
        first_image = variant.images.order(:position).first
        variant.update_column(:thumbnail_id, first_image.id) if first_image
      end

      puts 'Backfilling product thumbnails...'
      Spree::Product.where(thumbnail_id: nil).where.not(media_count: 0).find_each do |product|
        first_media = product.gallery_media.first
        product.update_column(:thumbnail_id, first_media.id) if first_media
      end

      puts 'Done!'
    end
  end
end
