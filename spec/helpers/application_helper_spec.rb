require 'rails_helper'

RSpec.describe ApplicationHelper, :type => :helper do

  describe '#is_edition_allowed?' do
    context 'User wants to edit her/his own public/private task' do
      it "returns true" do
        expect(is_edition_allowed?(1, 1)).to eq true
      end
    end

    context 'User wants to edit others task' do
      it "returns true" do
        expect(is_edition_allowed?(2, 1)).to eq false
      end
    end
  end

end
