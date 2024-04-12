require "test_helper"

class Api::V1::FeaturesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_features_index_url
    assert_response :success
  end

  test "should not save feature without title" do
    feature = Feature.new
    assert_not feature.save, "Saved the feature without a title"
  end
end
