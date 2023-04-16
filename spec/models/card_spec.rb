require 'rails_helper'

RSpec.describe Card, type: :model do
  describe "validations" do
    it { should validate_presence_of(:number) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:image_url) }
    it { should validate_presence_of(:card_type_id) }
    it { should validate_presence_of(:card_rarity_id) }
    it { should validate_presence_of(:serie_set_id) }
  end

  describe "associations" do
    it { should belong_to(:card_type) }
    it { should belong_to(:card_rarity) }
    it { should belong_to(:serie_set) }
  end

  describe "database columns" do
    it { should have_db_column(:number).of_type(:integer).with_options(null: false) }
    it { should have_db_column(:name).of_type(:string).with_options(null: false) }
    it { should have_db_column(:image_url).of_type(:string).with_options(null: false) }
    it { should have_db_column(:card_type_id).of_type(:uuid).with_options(null: false) }
    it { should have_db_column(:card_rarity_id).of_type(:uuid).with_options(null: false) }
    it { should have_db_column(:serie_set_id).of_type(:uuid).with_options(null: false) }
    it { should have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { should have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe "database indexes" do
    it { should have_db_index(:card_type_id) }
    it { should have_db_index(:card_rarity_id) }
    it { should have_db_index(:serie_set_id) }
  end
end
