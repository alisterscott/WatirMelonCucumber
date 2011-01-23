module Common
  def Common.get_search_term_data term
    YAML.load_file("#{TEST_DATA_DIR}/search_test_data.yml")["search terms"][term]["search term"]
  end

  def Common.get_search_term_exp_res term
    YAML.load_file("#{TEST_DATA_DIR}/search_test_data.yml")["search terms"][term]["expected results"]
  end
end