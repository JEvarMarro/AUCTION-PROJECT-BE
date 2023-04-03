require "test_helper"

class CardConditionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card_condition = card_conditions(:one)
  end

  test "should get index" do
    get card_conditions_url, as: :json
    assert_response :success
  end

  test "should create card_condition" do
    assert_difference("CardState.count") do
      post card_conditions_url, params: { card_condition: { auction_item_id: @card_condition.auction_item_id, name: @card_condition.name } }, as: :json
    end

    assert_response :created
  end

  test "should show card_condition" do
    get card_condition_url(@card_condition), as: :json
    assert_response :success
  end

  test "should update card_condition" do
    patch card_condition_url(@card_condition), params: { card_condition: { auction_item_id: @card_condition.auction_item_id, name: @card_condition.name } }, as: :json
    assert_response :success
  end

  test "should destroy card_condition" do
    assert_difference("CardState.count", -1) do
      delete card_condition_url(@card_condition), as: :json
    end

    assert_response :no_content
  end
end
