require 'spec_helper'

describe "Authentication" do
  describe "signin" do
    before { visit signin_path }

    describe "with invalid information" do
      before do
        click_link "Вход"
        click_button "Войти"
      end

      describe "after visiting another page" do
        before { click_link "Poedem" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        click_link "Вход"
        fill_in "E-mail",    with: user.email.upcase
        fill_in "Пароль", with: user.password
        click_button "Войти"
      end

      it { should have_selector('title', text: user.name) }
      it { should have_link('Profile', href: user_path(user)) }
      it { should have_link('Sign out', href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
    end
  end
end
