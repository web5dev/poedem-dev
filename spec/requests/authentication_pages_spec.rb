require 'spec_helper'

describe "Authentication" do

  subject { page }

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

      before { click_link user.email }

      it { should have_title(user.name) }
      it { should have_link('Мой профиль', href: user_path(user)) }
      it { should have_link('Выход', href: signout_path) }
      it { should_not have_link('Вход') }

      describe "followed by signout" do
        before { click_link "Выход" }
        it { should have_link('Вход') }
      end
    end
  end
end
