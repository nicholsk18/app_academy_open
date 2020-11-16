require_relative "room"

class Hotel
    def initialize(name, availible_rooms)
        @name = name # Hotel name
        @rooms = Hash.new()

        # availible rooms is a hash with rooms and there capacity
        availible_rooms.each do |room_name, capacity|
            @rooms[room_name] = Room.new(capacity)
        end
    end

    def name
        @name.split.map(&:capitalize).join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room)
        @rooms.has_key?(room)
    end

    def check_in(person, room_name)
        if self.room_exists?(room_name)
            if @rooms[room_name].add_occupant(person)
                p "check in successful"
            else
                p "sorry, room is full"
            end
        else
            p "sorry, room does not exist"
        end
    end

    def has_vacancy?
        @rooms.values.any? { |room| !room.full? }
    end

    def list_rooms
        @rooms.each do |room_name, room|
            puts "#{room_name} : #{room.available_space}"
        end
    end
end
