require 'rails_helper'

RSpec.describe Movie, type: :model do
  it {should validate_uniqueness_of :title}


end
