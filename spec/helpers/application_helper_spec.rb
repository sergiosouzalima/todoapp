require 'rails_helper'

RSpec.describe ApplicationHelper, :type => :helper do

  describe '#is_edition_allowed?' do
    context 'User wants to edit her/his own public task' do
      it "returns true" do
        expect(is_edition_allowed?(1, 'public', 1)).to eq true
      end
    end

    context 'User wants to edit her/his own private task' do
      it "returns true" do
        expect(is_edition_allowed?(1, 'private', 1)).to eq true
      end
    end

    context 'User wants to edit others public task' do
      it "returns true" do
        expect(is_edition_allowed?(2, 'public', 1)).to eq true
      end
    end

    context 'User wants to edit others private task' do
      it "returns true" do
        expect(is_edition_allowed?(2, 'private', 1)).to eq false
      end
    end
  end

end
