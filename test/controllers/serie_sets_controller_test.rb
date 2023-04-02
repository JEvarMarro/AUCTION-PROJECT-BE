require "test_helper"

class SerieSetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @serie_set = serie_sets(:one)
  end

  test "should get index" do
    get serie_sets_url, as: :json
    assert_response :success
  end

  test "should create serie_set" do
    assert_difference("SerieSet.count") do
      post serie_sets_url, params: { serie_set: { description: @serie_set.description, name: @serie_set.name, serie_id: @serie_set.serie_id } }, as: :json
    end

    assert_response :created
  end

  test "should show serie_set" do
    get serie_set_url(@serie_set), as: :json
    assert_response :success
  end

  test "should update serie_set" do
    patch serie_set_url(@serie_set), params: { serie_set: { description: @serie_set.description, name: @serie_set.name, serie_id: @serie_set.serie_id } }, as: :json
    assert_response :success
  end

  test "should destroy serie_set" do
    assert_difference("SerieSet.count", -1) do
      delete serie_set_url(@serie_set), as: :json
    end

    assert_response :no_content
  end
end
