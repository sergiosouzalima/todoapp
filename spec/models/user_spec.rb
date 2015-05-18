# encoding : utf-8
require 'rails_helper'
require 'shoulda/matchers'

describe User do
  context "attributes validation" do
    context 'name' do
      it { should respond_to :name }
      it { should validate_presence_of(:name) }
      it { should validate_uniqueness_of(:name) }
    end

    context 'password' do
      it { should respond_to :password }
      it { should respond_to :password_confirmation }
      it { should validate_presence_of(:password) }
      it { should validate_length_of(:password).is_at_least(8) }
      it { should validate_length_of(:password).is_at_most(40) }
    end

    context 'email' do
      it { should respond_to :email }
      it { should validate_presence_of(:email) }
      it { should validate_uniqueness_of(:email) }

      invalid_emails = ["b lah","bälah","b@lah","bülah","bßlah","b!lah","b%lah","b)lah"]
      invalid_emails.each do |s|
        it { should_not allow_value(s).for(:email) }
      end
    end

    context 'role' do
      it { should respond_to :role }
    end
  end

 end
