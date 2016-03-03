module ProjectHelper
  def validate_length(string_variable, min, max)
    is_valid_length =  string_variable > min && string_variable < max
  end
end
