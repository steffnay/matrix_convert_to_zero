# Updates the input matrix based on the following rules:
# Assumption/ Given: All numbers in the matrix are 0s or 1s
# If any number is found to be 0, the method updates all the numbers in the
# corresponding row as well as the corresponding column to be 0.
def matrix_convert_to_0(matrix)
  row = []
  column = []

  r = 0
  c = 0

  while r < matrix.length
    while c < matrix[r].length
      if matrix[r][c] == 0
        row << r
        column << c
      end
      c += 1
    end
    c = 0
    r += 1
  end

  print row
  print column
  i = 0

  while i < row.length
    x = row[i]
    y = 0

    while y < matrix[x].length
      matrix[x][y] = 0
      y += 1
    end
    i += 1
  end

  i = 0

  while i < column.length
    x = column[i]
    y = 0

    while y < matrix.length
      matrix[y][x] = 0
      y += 1
    end

    y = 0
    i += 1
  end

  return matrix
end
