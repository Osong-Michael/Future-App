require 'rails_helper'

RSpec.describe CarsController, type: :controller do
  it { should use_before_action(:require_user) }
  it { should use_before_action(:set_car_params) }
  it { should use_before_action(:block_btn) }
  it { should use_before_action(:block_edit) }
end