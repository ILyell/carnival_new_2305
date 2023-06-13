class Carnival

    attr_reader :duration, :rides

    def initialize(rides, duration)
        @rides = rides
        @duration = duration
    end

    def most_profitable_ride
        @rides.max_by {|ride| ride.total_revenue}
    end

    def most_popular_ride
        @rides.max_by {|ride| ride.total_rides}
    end

    def total_revenue
        revenue = @rides.map {|ride| ride.total_revenue}
        revenue.sum
    end
end