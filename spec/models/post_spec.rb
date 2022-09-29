require 'rails_helper'

RSpec.describe Post, type: :model do
  # Validation tests
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:payload) }
end
