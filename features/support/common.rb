module Common
  def Common.string_to_f numerical_string
    numerical_string.gsub(",","").to_f
  end

  def Common.get_search_term_data term
    YAML.load_file("#{TEST_DATA_DIR}/google_search_test_data.yml")["search terms"][term]["search term"]
  end

  def Common.get_search_term_exp_res term
    YAML.load_file("#{TEST_DATA_DIR}/google_search_test_data.yml")["search terms"][term]["expected results"]
  end
end