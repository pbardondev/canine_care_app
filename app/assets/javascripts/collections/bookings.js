DogSittingApp.Collections.Bookings = Backbone.Collection.extend({

    url: 'bookings/',

    model: DogSittingApp.Models.Booking,

    getOrFetch: function(id) {
        var booking = this.get(id);
        var bookings = this;
        function addBooking() {
            bookings.add(booking)
        }
        if (!booking) {
            booking = new DogSittingApp.Models.Booking({ id: id });
            booking.fetch({success: addBooking});
        } else {
            booking.fetch();
        }
        return booking;
    }
});
