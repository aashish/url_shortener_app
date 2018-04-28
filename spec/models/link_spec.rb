require 'rails_helper'

RSpec.describe Link, type: :model do
  it 'is valid with valid attributes' do
    expect(build(:link)).to be_valid
  end

  it 'should not allow duplicate given_url' do
    link1 = create(:link, given_url: 'https://wwww.google.com')
    link2 = build(:link, given_url: 'https://wwww.google.com')
    link2.save

    expect(link2.errors.present?).to eq(true)
    expect(link2.errors.messages[:given_url]).to eq(['has already been taken'])
  end

  it 'should not allow invalid url' do
    link = build(:link, given_url: 'railsguides')
    link.save
    expect(link.errors.full_messages).to eq(['Given url is not a valid URL'])
  end

  it 'should have unique slug' do
    link1 = create(:link, given_url: 'http://wwww.google.com')
    link2 = create(:link, given_url: 'http://wwww.youtube.com')

    expect(link2.slug).to_not eq(link1.slug)
  end

  it 'is not valid without a click' do
    link1 = build(:link, given_url: 'https://wwww.google.com', clicks: nil)
    link1.save

    expect(link1.errors.full_messages).to eq(["Clicks can't be blank"])
  end
end
