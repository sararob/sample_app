require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin" do

      before { visit signin_path }

      describe "with invalid information" do
        let(:user) { FactoryGirl.create(:user) }
              before { sign_in user }

              it { should have_selector('title', text: user.name) }
              it { should have_link('Profile',  href: user_path(user)) }
              it { should have_link('Settings', href: edit_user_path(user)) }
              it { should have_link('Sign out', href: signout_path) }
              it { should_not have_link('Sign in', href: signin_path) }

        describe "after visiting another page" do
          before { click_link "Home" }
          it { should_not have_selector('div.alert.alert-error') }
          describe "followed by signout" do
                  before { click_link "Sign out" }
                  it { should have_link('Sign in') }
                end
        end
      end
        end
      end