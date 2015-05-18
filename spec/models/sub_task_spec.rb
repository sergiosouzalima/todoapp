# encoding : utf-8
require 'rails_helper'

describe SubTask do
  context "attributes validation" do
    context 'name' do
      it { should respond_to :name }
      it { should validate_presence_of(:name) }
    end
  end

 end
