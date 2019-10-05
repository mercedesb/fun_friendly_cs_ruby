# frozen_string_literal: true

class Polymorphism::Knitting
  module Stitch
    KNIT = 'knit'
    PURL = 'purl'
  end

  attr_reader :row_length, :tool

  def initialize(row_length)
    @row_length = row_length
    @tool = '2 needles'
  end

  def create_fabric(number_of_rows)
    raise 'Must specify a number of rows to create your fabric.' unless number_of_rows&.is_a?(Integer)

    fabric = []
    number_of_rows.times do |row|
      fabric << if row.even?
                  stitch_row(Stitch::KNIT)
                else
                  stitch_row(Stitch::PURL)
                end
    end

    fabric
  end

  private

  def stitch_row(stitch)
    row = ''
    row_length.times do
      row += send(stitch)
    end

    row += "Turn.\n"
    row
  end

  def knit
    'Created a knit stitch; '
  end

  def purl
    'Created a purl stitch; '
  end
end
