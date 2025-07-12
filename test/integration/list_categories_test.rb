require "test_helper"

class ListCategoriesTest < ActionDispatch::IntegrationTest
  setup do
    @category1 = Category.create(name: "Sports")
    @category2 = Category.create(name: "Books")
  end

  test "should get categoies listing" do
    get categories_url
    
  end

end
