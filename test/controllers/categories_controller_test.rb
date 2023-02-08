require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/categories.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Category.count, data.length
  end
end

test "create" do
  assert_difference "Category.count", 1 do
    post "/categories.json", params: { name: "housework" }
    assert_response 200
  end
end
