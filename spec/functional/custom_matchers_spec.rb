require 'spec_helper'

describe "Customer Matchers" do
  include_context "user_context"

  describe "user.rabl" do
    rabl_data(:root => 'user'){ user }
    it{ should render(:guid) }
    it{ should render(:first_name) }
    it{ should render(:last_name) }
    it{ should render(:email) }
    it{ should_not render(:password) }
  end

  describe "user_aliases.rabl" do
    rabl_data(:root => 'user'){ user }
    it{ should render(:id).with(:guid) }
    it{ should render(:team).with_value('Gorby Puff') }
  end

  describe "index.rabl" do
    rabl_data(:root => 'users', :object_root => 'user'){ [user] }
    it{ should render(:guid) }
    it{ should render(:first_name) }
    it{ should render(:last_name) }
    it{ should render(:email) }
    it{ should_not render(:password) }
  end

  describe "rootless_index.rabl" do
    rabl_data(:root => false, :object_root => 'user'){ [user] }
    it{ should render(:guid) }
    it{ should_not render(:password) }
  end

  describe "bare_index.rabl" do
    rabl_data(:root => false, :object_root => false){ [user] }
    it{ should render(:guid) }
    it{ should_not render(:password) }
  end

  describe "nested/test.rabl" do
    rabl_data(:root => 'test'){ user }
    it{ should render(:guid) }
  end
end
