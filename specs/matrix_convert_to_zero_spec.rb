require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../lib/matrix_convert_to_zero'

# helper method for creating and initializing a matrix with all 1s
def initialize_matrix(rows, columns)
  # create the matrix using the rows and columns
  matrix = Array.new(rows){Array.new(columns)}

  # initialize the matrix
  rows.times do |row|
    columns.times do |column|
      matrix[row][column] = 1
    end
  end

  return matrix
end

# helper method for verifying updated matrix
def verify_matrix(matrix, rows_array, columns_array)
  # deduce the rows and columns in the matrix
  rows = matrix.size
  columns = matrix[0].size

  rows.times do |row|
    columns.times do |column|
      if (rows_array.include?(row) || columns_array.include?(column))
        matrix[row][column].must_equal 0
      else
        matrix[row][column].must_equal 1
      end
    end
  end
end

describe "matrix convert to zero" do
  describe "basic tests" do
    it "rows 1 & 2, columns 3 & 4 are 0" do
      # setup
      rows = 3
      columns = 5
      matrix = initialize_matrix(rows, columns)
      matrix[1][3] = 0 # row 1, column 3
      matrix[2][4] = 0 # row 2, column 4
      rows_array = [1, 2]
      columns_array = [3, 4]

      # method call
      matrix_convert_to_0(matrix)

      # validation
      verify_matrix(matrix, rows_array, columns_array)
    end

    it "rows 0, 1, 2, 3, 4, column 1 are 0" do
      # setup
      rows = 5
      columns = 3
      matrix = initialize_matrix(rows, columns)
      matrix[0][1] = 0 # row 0, column 1
      matrix[1][1] = 0 # row 1, column 1
      matrix[2][1] = 0 # row 2, column 1
      matrix[3][1] = 0 # row 3, column 1
      matrix[4][1] = 0 # row 4, column 1
      rows_array = [0, 1, 2, 3, 4]
      columns_array = [1]

      # method call
      matrix_convert_to_0(matrix)

      # validation
      verify_matrix(matrix, rows_array, columns_array)
    end
  end

  describe "edge case" do
    it "no 0s" do
      # setup
      rows = 4
      columns = 4
      matrix = initialize_matrix(rows, columns)
      rows_array = []
      columns_array = []

      # method call
      matrix_convert_to_0(matrix)

      # validation
      verify_matrix(matrix, rows_array, columns_array)
    end
  end
end
