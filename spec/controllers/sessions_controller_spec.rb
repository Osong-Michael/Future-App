require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  it { should route(:get, '/login').to(action: :new) }
  it { should route(:post, '/login').to(action: :create) }
  it { should route(:delete, '/logout').to(action: :destroy) }
end
