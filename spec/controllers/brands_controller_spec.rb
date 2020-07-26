require 'rails_helper'

RSpec.describe BrandsController, type: :controller do
  it { should use_before_action(:require_user) }
end