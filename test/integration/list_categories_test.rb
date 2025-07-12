require "test_helper"

class ListCategoriesTest < ActionDispatch::IntegrationTest
  setup do
    @category1 = Category.create(name: "Sports")
    @category2 = Category.create(name: "Books")
  end

  test "should get categoies listing" do
    get categories_url    # '/categories'
    assert_select "a[href=?]", category_path(@cateogy1), text: @category1.name
    assert_select "a[href=?]", category_path(@cateogy2), text: @category2.name
  end

end
