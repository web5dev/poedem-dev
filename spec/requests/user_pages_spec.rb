require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_title('Регистрация') }

    let(:submit) { "Зарегистрировать" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Имя",                with: "Example User"
        fill_in "Электронная почта",  with: "user@example.com"
        fill_in "Пароль для входа",   with: "foobar"
        fill_in "Подтвердите пароль", with: "foobar"
        fill_in "Номер телефона",     with: "1234567"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do

        it { should have_selector('a', 'Выход') }
      end
    end
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_title(user.name) }
  end
end
