# frozen_string_literal: true

class Polymorphism::Weaving
  attr_reader :row_length, :tool

  def initialize(row_length)
    @row_length = row_length
    @tool = 'Loom and shuttle'
  end

  def create_fabric(number_of_rows)
    raise 'Must specify a number of rows to create your fabric.' unless number_of_rows&.is_a?(Integer)

    fabric = []
    number_of_rows.times do |row|
      fabric << weave_row(row)
    end

    fabric
  end

  private

  def weave_row(row_number)
    row = ''

    # start with Over when rowNumber is even, then every even stitch
    # start with Under when rowNumber is odd, then every even stitch
    row_length.times do |stitch_number|
      row += if (row_number.even? && stitch_number.even?) || (row_number.odd? && stitch_number.odd?)
               weave_weft_over_warp
             else
               weave_weft_under_warp
             end
    end

    row += "Turn.\n"
    row
  end

  def weave_weft_under_warp
    'Weft thread under the warp; '
  end

  def weave_weft_over_warp
    'Weft thread over the warp; '
  end
end
