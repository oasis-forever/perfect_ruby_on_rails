module EventHelper
  def show_image_if_attached(event)
    return unless event.has_image_to_show?
    image_tag event.image.variant(resize_to_fit: [200, 200]), class: 'img-thumnail d-block mb-3'
  end
end
