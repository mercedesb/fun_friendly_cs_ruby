# frozen_string_literal: true

class Polymorphism::Crocheting
  attr_reader :row_length, :tool

  def initialize(row_length)
    @row_length = row_length
    @tool = '1 hook'
  end

  def create_fabric(number_of_rows)
    raise 'Must specify a number of rows to create your fabric.' unless number_of_rows&.is_a?(Integer)

    fabric = []
    number_of_rows.times do
      fabric << stitch_row
    end

    fabric
  end

  private

  def stitch_row
    row = ''
    row_length.times do
      row += single_crochet
    end

    row += "Turn.\n"
    row
  end

  def single_crochet
    'Created a single crochet stitch; '
  end
end
