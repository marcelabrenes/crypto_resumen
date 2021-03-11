require "test_helper"

class PetitionsControllerTest < ActionDispatch::IntegrationTest
  test "should get crypto" do
    get petitions_crypto_url
    assert_response :success
  end
end
