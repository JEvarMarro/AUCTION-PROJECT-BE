require 'rails_helper'

RSpec.describe Serie, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:release_date) }
  end

  describe "associations" do
    it { should have_many(:serie_sets) }
    it { should have_many(:cards).through(:serie_sets) }
  end

  describe "database columns" do
    it { should have_db_column(:name).of_type(:string).with_options(null: false) }
    it { should have_db_column(:release_date).of_type(:date).with_options(null: false) }
    it { should have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { should have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end
end
