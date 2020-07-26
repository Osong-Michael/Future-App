require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  it do
    params = {
      user: { username: 'John' }
    }
    should permit(:username)
      .for(:create, params: params)
      .on(:user)
  end
end
