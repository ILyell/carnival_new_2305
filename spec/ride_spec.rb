require 'spec_helper'

RSpec.describe Ride do
    before(:each) do
        @visitor1 = Visitor.new('Bruce', 54, '$10')
        @visitor2 = Visitor.new('Tucker', 36, '$5')
        @visitor3 = Visitor.new('Penny', 64, '$15')
        @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
        @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
        @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
    end
    describe '#initialize(ride_hash)' do
        it 'exist' do
            expect(@ride1).to be_a(Ride)
            expect(@ride2).to be_a(Ride)
            expect(@ride3).to be_a(Ride)
        end

        it 'is created with a hash, and has 4 attributes from that hash' do
            expect(@ride1.name).to eq('Carousel')
            expect(@ride1.min_height).to eq(24)
            expect(@ride1.admission_fee).to eq(1)
            expect(@ride1.excitement).to eq(:gentle)   
            
            expect(@ride2.name).to eq('Ferris Wheel')
            expect(@ride2.min_height).to eq(36)
            expect(@ride2.admission_fee).to eq(5)
            expect(@ride2.excitement).to eq(:gentle)
        end

        it 'has an empty hash for rider_logs' do
            expect(@ride1.rider_logs).to eq({})
            expect(@ride2.rider_logs).to eq({})
            expect(@ride3.rider_logs).to eq({})
        end
    end
    
    describe '#board_rider(visitor)' do
        it 'adds a ride object to the ride_log' do
            expect(@ride1.rider_logs).to eq({})
            @visitor1.add_preference(:gentle)
            @ride1.board_rider(@visitor1)
            expect(@ride1.rider_logs).to eq({@visitor1 => 1})
            @visitor2.add_preference(:gentle)
            
            @ride1.board_rider(@visitor2)
            
            @ride1.board_rider(@visitor1)
            expect(@ride1.rider_logs).to eq({@visitor1 => 2, @visitor2 => 1})
            
        end
    end

    describe 'total_revenue' do
        it 'calculates the total revenue earned' do
            @visitor1.add_preference(:gentle)
            @visitor2.add_preference(:gentle)

            expect(@ride1.total_revenue).to eq(0)
            @ride1.board_rider(@visitor1)
            expect(@ride1.total_revenue).to eq(1)
            @ride1.board_rider(@visitor2)
            expect(@ride1.total_revenue).to eq(2)
            @ride1.board_rider(@visitor1)
            expect(@ride1.total_revenue).to eq(3)

        end
    end

end