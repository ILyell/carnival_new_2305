require 'spec_helper'

RSpec.describe Carnival do
    before(:each) do
        @visitor1 = Visitor.new('Bruce', 54, '$12')
        @visitor2 = Visitor.new('Tucker', 36, '$15')
        @visitor3 = Visitor.new('Penny', 64, '$25')
        @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
        @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
        @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
        rides = [@ride1, @ride2, @ride3]
        @carnival = Carnival.new(rides, 14)
    end

    describe '#initialize' do
        it 'exist' do
            expect(@carnival).to be_a(Carnival)
        end

        it 'has a duration and a ride array' do
            expect(@carnival.duration).to eq(14)
            expect(@carnival.rides).to eq([@ride1, @ride2, @ride3])
        end
    end

    describe '#most_profitable_ride' do
        it 'finds the most profitable ride' do
            @visitor1.add_preference(:gentle)
            @visitor2.add_preference(:gentle)
            @visitor3.add_preference(:gentle)
            @visitor3.add_preference(:thrilling)

            expect(@ride1.total_revenue).to eq(0)
            @ride1.board_rider(@visitor1)
            expect(@ride1.total_revenue).to eq(1)
            @ride1.board_rider(@visitor2)
            expect(@ride1.total_revenue).to eq(2)
            @ride1.board_rider(@visitor1)
            expect(@ride1.total_revenue).to eq(3)

            expect(@ride2.total_revenue).to eq(0)
            @ride2.board_rider(@visitor1)
            expect(@ride2.total_revenue).to eq(5)
            @ride2.board_rider(@visitor3)
            expect(@ride2.total_revenue).to eq(10)
            @ride2.board_rider(@visitor1)
            expect(@ride2.total_revenue).to eq(15)

            @ride3.board_rider(@visitor3)
            expect(@ride3.total_revenue).to eq(2)
            
            expect(@carnival.most_profitable_ride).to eq(@ride2)
        end
    end

    describe '#most_popular_ride' do
        it 'finds the most popular ride' do
            @visitor1.add_preference(:gentle)
            @visitor2.add_preference(:gentle)
            @visitor3.add_preference(:gentle)
            @ride1.board_rider(@visitor1)
            @ride1.board_rider(@visitor1)
            @ride1.board_rider(@visitor1)
            @ride1.board_rider(@visitor1)
            @ride1.board_rider(@visitor2)
            @ride1.board_rider(@visitor2)
            @ride1.board_rider(@visitor2)
            @ride2.board_rider(@visitor3)
            @ride2.board_rider(@visitor3)

            expect(@carnival.most_popular_ride).to eq(@ride1)
        end
    end

    describe '#total_revenue' do
        it 'finds the total revenue of the carnival' do
            @visitor1.add_preference(:gentle)
            @visitor2.add_preference(:gentle)
            @visitor3.add_preference(:gentle)

            expect(@ride1.total_revenue).to eq(0)
            @ride1.board_rider(@visitor1)
            expect(@ride1.total_revenue).to eq(1)
            @ride1.board_rider(@visitor2)
            expect(@ride1.total_revenue).to eq(2)
            @ride1.board_rider(@visitor1)
            expect(@ride1.total_revenue).to eq(3)

            expect(@ride2.total_revenue).to eq(0)
            @ride2.board_rider(@visitor1)
            expect(@ride2.total_revenue).to eq(5)
            @ride2.board_rider(@visitor3)
            expect(@ride2.total_revenue).to eq(10)
            @ride2.board_rider(@visitor1)
            expect(@ride2.total_revenue).to eq(15)

            expect(@carnival.total_revenue).to eq(18)
        end
    end

    describe '#summary' do
        it 'returns a summary' do
            @visitor1.add_preference(:gentle)
            @visitor2.add_preference(:gentle)
            @visitor3.add_preference(:gentle)
            @ride1.board_rider(@visitor1)
            @ride1.board_rider(@visitor1)
            @ride1.board_rider(@visitor1)
            @ride1.board_rider(@visitor1)
            @ride1.board_rider(@visitor2)
            @ride1.board_rider(@visitor2)
            @ride1.board_rider(@visitor2)
            @ride2.board_rider(@visitor3)
            @ride2.board_rider(@visitor3)

            expect(@carnival.summary).to eq(3)
        end
    end
end