class Ride

    attr_reader :name, :min_height, :admission_fee, :excitement, :rider_logs

    def initialize(ride_hash)
        @name = ride_hash[:name]
        @min_height = ride_hash[:min_height]
        @admission_fee = ride_hash[:admission_fee]
        @excitement = ride_hash[:excitement]
        @rider_logs = Hash.new(0)
    end

    def board_rider(rider)
        if rider.tall_enough?(@min_height) && rider.preferences.include?(@excitement)
            rider.spend_money(@admission_fee)
            @rider_logs[rider] += 1 
        end
    end

    def total_revenue
        total_rides = @rider_logs.values
        @admission_fee * total_rides.sum
    end
end