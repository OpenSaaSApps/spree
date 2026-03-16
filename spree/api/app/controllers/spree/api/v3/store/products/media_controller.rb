module Spree
  module Api
    module V3
      module Store
        module Products
          class MediaController < Store::BaseController
            def index
              product = find_product
              media = product.gallery_media.accessible_by(current_ability, :show)
              media = paginate(media)

              render_serialized_payload do
                serialize_collection(media, serializer: Spree.api.media_serializer)
              end
            end

            private

            def find_product
              scope = current_store.products.active(current_currency).accessible_by(current_ability, :show)

              if params[:product_id].to_s.start_with?('prod_')
                scope.find_by_prefix_id!(params[:product_id])
              else
                scope.i18n.find_by!(slug: params[:product_id])
              end
            end
          end
        end
      end
    end
  end
end
