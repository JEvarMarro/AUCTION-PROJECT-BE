require 'rails_helper'

RSpec.describe SerieSet, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:release_date) }
    it { should validate_presence_of(:serie_id) }
    it { should validate_presence_of(:total_amount) }
  end

  describe "associations" do
    it { should belong_to(:serie) }
    it { should have_many(:cards) }
  end

  describe "database columns" do
    it { should have_db_column(:name).of_type(:string).with_options(null: false) }
    it { should have_db_column(:total_amount).of_type(:integer).with_options(null: false) }
    it { should have_db_column(:release_date).of_type(:date).with_options(null: false) }
    it { should have_db_column(:serie_id).of_type(:uuid).with_options(null: false) }
    it { should have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { should have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe "database indexes" do
    it { should have_db_index(:serie_id) }
  end
end
