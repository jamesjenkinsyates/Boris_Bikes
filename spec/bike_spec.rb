require 'bike'

describe Bike do

	let(:bike) { Bike.new}

	it 'can have a user' do
		bike = Bike.new :user
		expect(bike).to have_user
	end

	it 'can have no user' do
		expect(bike).not_to have_user
	end

	it 'is not broken when created' do
		expect(bike).not_to be_broken
	end

	it 'can be broken' do
		bike.break
		expect(bike).to be_broken
	end

end