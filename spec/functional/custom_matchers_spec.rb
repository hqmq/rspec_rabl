require 'spec_helper'

describe "Customer Matchers" do
  include_context "user_context"

  describe "user.rabl" do
    rabl_data(:root => 'user'){ user }
    it{ should render_attribute(:guid) }
    it{ should render_attribute(:first_name) }
    it{ should render_attribute(:last_name) }
    it{ should render_attribute(:email) }
    it{ should_not render_attribute(:password) }
  end

  describe "user_aliases.rabl" do
    rabl_data(:root => 'user'){ user }
    it{ should render_attribute(:id).with(:guid) }
    it{ should render_attribute(:team).with_value('Gorby Puff') }
  end

  describe "index.rabl" do
    rabl_data(:root => 'users', :object_root => 'user'){ [user] }
    it{ should render_attribute(:guid) }
    it{ should render_attribute(:first_name) }
    it{ should render_attribute(:last_name) }
    it{ should render_attribute(:email) }
    it{ should_not render_attribute(:password) }
  end

  describe "rootless_index.rabl" do
    rabl_data(:root => false, :object_root => 'user'){ [user] }
    it{ should render_attribute(:guid) }
    it{ should_not render_attribute(:password) }
  end

  describe "bare_index.rabl" do
    rabl_data(:root => false, :object_root => false){ [user] }
    it{ should render_attribute(:guid) }
    it{ should_not render_attribute(:password) }
  end

  describe "nested/test.rabl" do
    rabl_data(:root => 'test'){ user }
    it{ should render_attribute(:guid) }
  end
end