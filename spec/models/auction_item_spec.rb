require 'rails_helper'

RSpec.describe AuctionItem, type: :model do
  describe "validations" do
    it { should validate_presence_of(:card_id) }
    it { should validate_presence_of(:card_condition_id) }
    it { should validate_presence_of(:current_price) }
    it { should validate_presence_of(:minimum_bid) }
    it { should validate_presence_of(:end_date) }
  end

  describe "associations" do
    it { should belong_to(:card) }
    it { should belong_to(:card_condition) }
  end

  describe "database columns" do
    it { should have_db_column(:card_id).of_type(:uuid).with_options(null: false) }
    it { should have_db_column(:card_condition_id).of_type(:uuid).with_options(null: false) }
    it { should have_db_column(:current_price).of_type(:float).with_options(null: false) }
    it { should have_db_column(:minimum_bid).of_type(:float).with_options(null: false) }
    it { should have_db_column(:end_date).of_type(:datetime).with_options(null: false) }
    it { should have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { should have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe "database indexes" do
    it { should have_db_index(:card_id) }
    it { should have_db_index(:card_condition_id) }
  end
end
