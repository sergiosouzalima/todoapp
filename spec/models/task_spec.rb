# encoding : utf-8
require 'rails_helper'

describe Task do
  context "attributes validation" do
    context 'name' do
      it { should respond_to :name }
      it { should validate_presence_of(:name) }
      it { should validate_uniqueness_of(:name) }
    end

    context 'public' do
      it { should respond_to :public }
      it { should validate_presence_of(:public) }
    end

  end

 end
