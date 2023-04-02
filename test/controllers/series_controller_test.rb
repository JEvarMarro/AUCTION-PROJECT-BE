require "test_helper"

class SeriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @series = series(:one)
  end

  test "should get index" do
    get series_url, as: :json
    assert_response :success
  end

  test "should create series" do
    assert_difference("Serie.count") do
      post series_url, params: { series: { name: @series.name, release_date: @series.release_date } }, as: :json
    end

    assert_response :created
  end

  test "should show series" do
    get series_url(@series), as: :json
    assert_response :success
  end

  test "should update series" do
    patch series_url(@series), params: { series: { name: @series.name, release_date: @series.release_date } }, as: :json
    assert_response :success
  end

  test "should destroy series" do
    assert_difference("Serie.count", -1) do
      delete series_url(@series), as: :json
    end

    assert_response :no_content
  end
end
