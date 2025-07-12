require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest

  setup do    
    @admin = User.create(username: "admin", email: "admin@blah.com", password: "admin", admin: true)
    sign_in_as(@admin)
  end

  test "get new category form and create category" do
    get "/category/new"
    assert_response :success
    assert_difference("Category.count", 1) do
      post categories_path, params: { category: { name: "Sports" } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Sports", response.body
  end

  test "get new category form and reject invalid category submission" do
    get "/category/new"
    assert_response :success
    assert_no_difference "Category.count" do
      post categories_path, params: { category: { name: " " } }      
    end    
    assert_match "Errors", response.body
    assert_select 'l1.danger'    
  end
end
