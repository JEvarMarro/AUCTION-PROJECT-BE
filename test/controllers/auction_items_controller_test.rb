require "test_helper"

class AuctionItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auction_item = auction_items(:one)
  end

  test "should get index" do
    get auction_items_url, as: :json
    assert_response :success
  end

  test "should create auction_item" do
    assert_difference("AuctionItem.count") do
      post auction_items_url, params: { auction_item: { card_id: @auction_item.card_id, current_price: @auction_item.current_price, end_date: @auction_item.end_date, minimum_bid: @auction_item.minimum_bid } }, as: :json
    end

    assert_response :created
  end

  test "should show auction_item" do
    get auction_item_url(@auction_item), as: :json
    assert_response :success
  end

  test "should update auction_item" do
    patch auction_item_url(@auction_item), params: { auction_item: { card_id: @auction_item.card_id, current_price: @auction_item.current_price, end_date: @auction_item.end_date, minimum_bid: @auction_item.minimum_bid } }, as: :json
    assert_response :success
  end

  test "should destroy auction_item" do
    assert_difference("AuctionItem.count", -1) do
      delete auction_item_url(@auction_item), as: :json
    end

    assert_response :no_content
  end
end
