require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe "Associations" do
    it { should have_and_belong_to_many(:posts) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
  end
end
