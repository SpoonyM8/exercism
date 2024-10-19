defmodule PaintByNumber do
  def palette_bit_size(color_count), do: ceil(:math.log2(color_count))

  def empty_picture(), do: <<>>

  def test_picture(), do: <<0::2, 1::2, 2::2, 3::2>>

  def prepend_pixel(picture, color_count, pixel_color_index) do
    <<pixel_color_index::size(palette_bit_size(color_count)), picture::bitstring>>
  end

  def get_first_pixel(<<>>, _), do: nil

  def get_first_pixel(picture, color_count) do
    first_size = palette_bit_size(color_count)
    <<first::size(first_size), _::bitstring>> = picture
    first
  end

  def drop_first_pixel(<<>>, _), do: <<>>

  def drop_first_pixel(picture, color_count) do
    first_size = palette_bit_size(color_count)
    <<_::size(first_size), rest::bitstring>> = picture
    rest
  end

  def concat_pictures(picture1, picture2), do: <<picture1::bitstring, picture2::bitstring>>
end
