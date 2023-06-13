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

    def summary
        summary_hash = {
            :visitor_count => (@rides.map {|ride| ride.rider_logs.keys}).count,
            :revenue_earned => total_revenue,
            :visitors => [],
            :rides => []
        }
        visitors_array = @rides.map {|ride| ride.rider_logs.keys}
        visitors_array.flatten.each do |visitor|
            summary_hash[:visitors] << {
                :visitor => visitor,
                :favorite_ride => @rides.max_by {|ride| ride.rider_logs[visitor]},
                :total_money_spent => @rides.find_all do |ride|
                    ride.rider_logs.include?(visitor)
                end
            }
        end
        @rides.each do |ride|
            summary_hash[:rides] << {
                :ride => ride,
                :riders => ride.rider_logs.keys,
                :total_revenue => ride.total_revenue
            }
        end 
        binding.pry
        summary_hash
    end
end