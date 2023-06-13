require 'spec_helper'

RSpec.describe Visitor do

    before(:each) do
        @visitor1 = Visitor.new('Bruce', 54, '$10')
        @visitor2 = Visitor.new('Tucker', 36, '$5')
        @visitor3 = Visitor.new('Penny', 64, '$15')
    end
    
    describe '#initialize' do
        it 'exist' do
        expect(@visitor1).to be_a(Visitor)
        end
        it 'starts with 4 attributes' do
            expect(@visitor1.name).to eq('Bruce')
            expect(@visitor1.height).to eq(54)
            expect(@visitor1.spending_money).to eq('$10')
            expect(@visitor1.preferences).to eq([])
        end
    end

    describe '#add_prefernce' do
        it 'pushes a prefernce symbol into the prefernces array' do
            expect(@visitor1.preferences).to eq([])
            @visitor1.add_preference(:gentle)
            expect(@visitor1.preferences).to eq([:gentle])
            @visitor1.add_preference(:thrilling)
            expect(@visitor1.preferences).to eq([:gentle, :thrilling])
        end
    end

    describe '#tall_enough?(int)' do
        it 'checks if a visitor is tall enough vs the given int' do
            expect(@visitor1.tall_enough?(54)).to eq(true)
            expect(@visitor2.tall_enough?(54)).to eq(false)
            expect(@visitor3.tall_enough?(54)).to eq(true)
        end
    end
end