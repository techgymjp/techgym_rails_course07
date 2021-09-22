module ImageHelper
  IMAGE_SIZES = { small: [48, 36], medium: [164, 123], large: [600, 450] }

  def resized_image_tag(image, size_name: :large)
    options = {
      size: resized_image_size(size_name: size_name),
      class: 'image-size rounded',
    }
    return image_tag "no_images/#{size_name}.png", options unless image.attached?

    combine_options = { gravity: :center, resize: "#{options[:size]}^", crop: "#{options[:size]}+0+0" }
    image_tag image.variant(combine_options: combine_options).processed, options
  end

  private

  def resized_image_size(size_name: :large)
    width, height = IMAGE_SIZES[size_name]
    "#{width}x#{height}"
  end
end
