require 'rails_helper'

RSpec.describe CardType, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  describe "database columns" do
    it { should have_db_column(:name).of_type(:string).with_options(null: false) }
    it { should have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { should have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end
end