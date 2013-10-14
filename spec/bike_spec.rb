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

	it 'can be not broken' do
		expect(bike.broken).to be_false
	end

	it 'can be broken' do
		user = double :user, { fall_down: @broken = true }
		expect(bike.broken).to be_true
	end

end