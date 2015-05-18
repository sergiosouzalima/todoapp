# encoding : utf-8
require 'rails_helper'

describe Task do
  let(:current_user_id) { FactoryGirl.create(:user, role: role).id }
  let(:role) { 2 }

  context "attributes validation" do
    subject { FactoryGirl.build(:task, user_id: current_user_id)  }

    context 'name' do
      it { should respond_to :name }
      it { should validate_presence_of(:name) }
      #it { should validate_uniqueness_of(:name) }
    end

    context 'public' do
      it { should respond_to :public }
      it { should validate_presence_of(:public) }
    end

    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_length_of(:name).is_at_most(50) }
  end

end
